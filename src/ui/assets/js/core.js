//Frontend
const getFrontendURL = (path = '') => `http://${location.host}/${path}`
const redirectToIndex = () => location.href = getFrontendURL();
const redirectToCart = (id = '') => location.href = getFrontendURL(`cart.html?id=${id}`);
const redirectToOrderSummary = (id = '') => location.href = getFrontendURL(`order_detail.html?id=${id}`);
//Backend
const getApiURL = (path = '') => `http://${location.host}/${path}`