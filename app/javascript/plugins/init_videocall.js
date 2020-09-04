
const initVideoCall = () => {
 const vidCallButton = document.querySelector("#vid-call-btn")
 vidCallButton.addEventListener("click", () => {
  run(vidCallButton);
});

async function run(vidCallButton) {

        let room = { url: vidCallButton.dataset.key }
        window.callFrame = window.DailyIframe.createFrame({
          iframeStyle: {
            position: 'fixed',
            border: 0,
            top: 0, left: 0,
            width: '100%',
            height: '100%',
          }
        });
        await callFrame.join({
          url: room.url,
          showLeaveButton: true
        });

        window.callFrame.on('left-meeting', leave);


        function leave(e) {
          callFrame.destroy();
          document.querySelector("iframe").remove()
        }
      }
};

 export { initVideoCall };
