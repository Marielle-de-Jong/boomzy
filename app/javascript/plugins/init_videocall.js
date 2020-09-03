
const initVideoCall = () => {
 const vidCallButton = document.querySelector("#vid-call-btn")
 vidCallButton.addEventListener("click", () => {
  console.log("clicked")
  run(vidCallButton);
});

async function run(vidCallButton) {
  console.log("Inside the thing")

        let room = { url: vidCallButton.dataset.key }
        window.callFrame = window.DailyIframe.createFrame({
          iframeStyle: {
            position: 'fixed',
            border: 0,
            top: 0, left: 0,
            width: '100%',
            height: '100%'
          }
        });
        await callFrame.join({
          url: room.url,
          showLeaveButton: true
        });

        function leave(e) {
          showEvent(e);
          callFrame.destroy();
        }
      }
};

 export { initVideoCall };
