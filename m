Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0763D21DF2A
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 19:53:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-RBLgGSlHN4OguxqAemzkrw-1; Mon, 13 Jul 2020 13:53:48 -0400
X-MC-Unique: RBLgGSlHN4OguxqAemzkrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 072D2107BF16;
	Mon, 13 Jul 2020 17:53:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6048D61465;
	Mon, 13 Jul 2020 17:53:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D8ED1809554;
	Mon, 13 Jul 2020 17:53:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DHrE8L006574 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 13:53:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F23A1007A36; Mon, 13 Jul 2020 17:53:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A0421007A2D
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 17:53:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93805856A56
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 17:53:12 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10064.outbound.protection.outlook.com [40.107.1.64]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-183-WbahYTzsPsu5awmAfEdBhQ-1; Mon, 13 Jul 2020 13:53:10 -0400
X-MC-Unique: WbahYTzsPsu5awmAfEdBhQ-1
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com (2603:10a6:803:4d::29)
	by VI1PR04MB4045.eurprd04.prod.outlook.com (2603:10a6:803:43::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20;
	Mon, 13 Jul 2020 17:53:06 +0000
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com
	([fe80::8459:4be8:7034:7a81]) by
	VI1PR04MB4046.eurprd04.prod.outlook.com
	([fe80::8459:4be8:7034:7a81%6]) with mapi id 15.20.3174.025;
	Mon, 13 Jul 2020 17:53:06 +0000
To: Eric Biggers <ebiggers@kernel.org>
References: <20200701045217.121126-1-ebiggers@kernel.org>
	<20200701045217.121126-6-ebiggers@kernel.org>
	<3f2d3409-2739-b121-0469-b14c86110b2d@nxp.com>
	<20200713160136.GA1696@sol.localdomain>
From: =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Message-ID: <780cb500-2241-61bc-eb44-6f872ad567d3@nxp.com>
Date: Mon, 13 Jul 2020 20:53:04 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
In-Reply-To: <20200713160136.GA1696@sol.localdomain>
Content-Language: en-US
X-ClientProxiedBy: VI1PR08CA0264.eurprd08.prod.outlook.com
	(2603:10a6:803:dc::37) To VI1PR04MB4046.eurprd04.prod.outlook.com
	(2603:10a6:803:4d::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.129] (84.117.251.185) by
	VI1PR08CA0264.eurprd08.prod.outlook.com (2603:10a6:803:dc::37)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22
	via Frontend Transport; Mon, 13 Jul 2020 17:53:06 +0000
X-Originating-IP: [84.117.251.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc39e25c-c5c2-4b5a-4331-08d8275598e0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4045:
X-Microsoft-Antispam-PRVS: <VI1PR04MB40458E035425EB717BEED00E98600@VI1PR04MB4045.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VnO+VCZsI7YnG4cgFbPhEOnzojLDh7PHQXIxRaSm0AFof8OffOBX9swOo4ewYc3DfKdTxgBhNWbe+BvDwMmJLvaNhD8UiDWpuBB8ZO0fmggVdxD3amQzwSYEN8GApeZEOkEEpVOvU0/9NprQJ25TdIPWIFx7pehoW01MKXy58hqkDz2XcH2txPQBcg8/C7W+1cMsAl9+209d/892HlTXoNVaTgOOBm46thN5DvUXMi9wHWhQYUOcuykExc/z93MV5ATgBgOLOExWx8jAcpt4ZSBf6gqvp6wRqmtgI49bcTaW0eOAjyWVTeEFO1HMzgIfXFQ4K2xuj4i/1PuPuRWAInp31WhS6j2RgWcPtFv5hrhQq4XTq/2JARmuez+/bjSVWDw6Aqeu4+cLSH4td8Q72j2KsuUXI2a6CU6cWUkQP7QxBBZMNgoTyoOe4kx8EQV5cgd6727A51LAkkxVZ4YmMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:VI1PR04MB4046.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(36756003)(31696002)(6916009)(66476007)(86362001)(66556008)(66946007)(8676002)(478600001)(966005)(4326008)(8936002)(5660300002)(956004)(2616005)(316002)(54906003)(31686004)(2906002)(26005)(16576012)(186003)(53546011)(83380400001)(52116002)(16526019)(6486002)(43740500002);
	DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: v/8aIDjdrH2N3Zf/VvhFi4PvCi3CVVxTnhHvNQDYSgGsXPunThCYtojtodr6jyw60tVpwboNedsj2F3f46nELHRw1HSaeeyYgbE+ZZrAVSs180jhvrP0TecxezNFhaXW+8seRnG5p7vIVDzwLdstzWfORPcnQVtqIun7+pFwALBWBRWbeVSr2vnmzT1MJSu5h10DB8hKTsv6ZF4RrwbFERb1RBNsjlZAWZWpMzodl87g52QQEpvLa9a4/xVdpdFBxXvxut+yJ4eBXj3NhRVWydgeaA687cMPx/UytwVtMUpswZ3pvDjIPMnw68pHMiG2wJy8NlbFM1JO58sZdCHg8jCw6QeJmmoloy4/cKnWpazg96ou+HNXU37pcUc/rJEhfbRqttwR7CA1PWVAwzZllIv+57BvXHs+Qi5biX1+MOetUF9mImo0lsPCmWR7HuCPn0yeAQVj3Qwfw82u5sSkm+N7LMlvySp1w9MqkLSRYEo3mb80MgRWh3/YZHVgxugp
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc39e25c-c5c2-4b5a-4331-08d8275598e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2020 17:53:06.5031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VySyus4Zb29Zvp/2jxsnJizV/jFuuxDEvEZ3+i93b2vZTI+/TJ7OQOdzcQI7RU0vzfA//3KVx4vMyEEVkQL1WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4045
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06DHrE8L006574
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [dm-devel] [PATCH 5/6] crypto: set the flag
	CRYPTO_ALG_ALLOCATES_MEMORY
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gNy8xMy8yMDIwIDc6MDEgUE0sIEVyaWMgQmlnZ2VycyB3cm90ZToKPiBPbiBNb24sIEp1bCAx
MywgMjAyMCBhdCAwNjo0OTowMFBNICswMzAwLCBIb3JpYSBHZWFudMSDIHdyb3RlOgo+PiBPbiA3
LzEvMjAyMCA3OjUyIEFNLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4+PiBGcm9tOiBNaWt1bGFzIFBh
dG9ja2EgPG1wYXRvY2thQHJlZGhhdC5jb20+Cj4+Pgo+Pj4gU2V0IHRoZSBmbGFnIENSWVBUT19B
TEdfQUxMT0NBVEVTX01FTU9SWSBpbiB0aGUgY3J5cHRvIGRyaXZlcnMgdGhhdAo+Pj4gYWxsb2Nh
dGUgbWVtb3J5Lgo+Pj4KPj4gUXVpdGUgYSBmZXcgZHJpdmVycyBhcmUgaW1wYWN0ZWQuCj4+Cj4+
IEkgd29uZGVyIHdoYXQncyB0aGUgcHJvcGVyIHdheSB0byBhZGRyZXNzIHRoZSBtZW1vcnkgYWxs
b2NhdGlvbi4KPj4KPj4gSGVyYmVydCBtZW50aW9uZWQgc2V0dGluZyB1cCByZXFzaXplOgo+PiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlwdG8vMjAyMDA2MTAwMTA0NTAuR0E2NDQ5
QGdvbmRvci5hcGFuYS5vcmcuYXUvCj4+Cj4+IEkgc2VlIGF0IGxlYXN0IHR3byBodXJkbGVzIGlu
IGNvbnZlcnRpbmcgdGhlIGRyaXZlcnMgdG8gdXNpbmcgcmVxc2l6ZToKPj4KPj4gMS4gU29tZSBk
cml2ZXJzIGFsbG9jYXRlIHRoZSBtZW1vcnkgdXNpbmcgR0ZQX0RNQQo+Pgo+PiByZXFzaXplIGRv
ZXMgbm90IGFsbG93IGRyaXZlcnMgdG8gY29udHJvbCBnZnAgYWxsb2NhdGlvbiBmbGFncy4KPj4K
Pj4gSSd2ZSB0cmllZCBjb252ZXJ0aW5nIHRhbGl0b3MgZHJpdmVyICh0byB1c2UgcmVxc2l6ZSkg
YXQgc29tZSBwb2ludCwKPj4gYW5kIGluIHRoZSBwcm9jZXNzIGFkZGluZyBhIGdlbmVyaWMgQ1JZ
UFRPX1RGTV9SRVFfRE1BIGZsYWc6Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNy
eXB0by81NEZEOEQzQi41MDQwNDA5QGZyZWVzY2FsZS5jb20KPj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtY3J5cHRvLzE0MjYyNjY4ODItMzE2MjYtMS1naXQtc2VuZC1lbWFpbC1ob3Jp
YS5nZWFudGFAZnJlZXNjYWxlLmNvbQo+Pgo+PiBUaGUgZmxhZyB3YXMgc3VwcG9zZWQgdG8gYmUg
dHJhbnNwYXJlbnQgZm9yIHRoZSB1c2VyLAo+PiBob3dldmVyIHRoZXJlIHdlcmUgdXNlcnMgdGhh
dCBvcGVuLWNvZGVkIHRoZSByZXF1ZXN0IGFsbG9jYXRpb24sCj4+IGZvciBleGFtcGxlIGVzcF9h
bGxvY190bXAoKSBpbiBuZXQvaXB2NC9lc3A0LmMuCj4+IEF0IHRoYXQgdGltZSwgRGF2ZSBOQUNL
LWVkIHRoZSBjaGFuZ2U6Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNyeXB0by8x
NDI2MjY2OTIyLTMxNjc5LTEtZ2l0LXNlbmQtZW1haWwtaG9yaWEuZ2VhbnRhQGZyZWVzY2FsZS5j
b20KPj4KPj4KPj4gMi4gTWVtb3J5IHJlcXVpcmVtZW50cyBjYW5ub3QgYmUgZGV0ZXJtaW5lZCAv
IGFyZSBub3Qga25vd24KPj4gYXQgcmVxdWVzdCBhbGxvY2F0aW9uIHRpbWUKPj4KPj4gQW4gYW5h
bHlzaXMgZm9yIHRhbGl0b3MgZHJpdmVyIGlzIGhlcmU6Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWNyeXB0by81NEY4MjM1Qi41MDgwMzAxQGZyZWVzY2FsZS5jb20KPj4KPj4gSW4g
Z2VuZXJhbCwgZHJpdmVycyB3b3VsZCBiZSBmb3JjZWQgdG8gYXNrIG1vcmUgbWVtb3J5IHRoYW4g
bmVlZGVkLAo+PiB0byBoYW5kbGUgdGhlICJ3b3JzdC1jYXNlIi4KPj4gTG9naWMgd2lsbCBiZSBu
ZWVkZWQgdG8gZmFpbCBpbiBjYXNlIHRoZSAid29yc3QtY2FzZSIgaXNuJ3QgY29ycmVjdGx5IGVz
dGltYXRlZC4KPj4KPj4gSG93ZXZlciwgdGhpcyBpcyBzdGlsbCBwcm9ibGVtYXRpYy4KPj4KPj4g
Rm9yIGV4YW1wbGUsIGEgZHJpdmVyIGNvdWxkIHNldCB1cCByZXFzaXplIHRvIGFjY29tbW9kYXRl
IGZvciAzMiBTL0cgZW50cmllcwo+PiAoaW4gdGhlIEhXIFMvRyB0YWJsZSkuIEluIGNhc2UgYSBk
bS1jcnlwdCBlbmNyeXB0aW9uIHJlcXVlc3Qgd291bGQgcmVxdWlyZSBtb3JlLAo+PiB0aGVuIGRy
aXZlcidzIC5lbmNyeXB0IGNhbGxiYWNrIHdvdWxkIGZhaWwsIHBvc3NpYmx5IHdpdGggLUVOT01F
TSwKPj4gc2luY2UgdGhlcmUncyBub3QgZW5vdWdoIHByZS1hbGxvY2F0ZWQgbWVtb3J5Lgo+PiBU
aGlzIGJyaW5ncyB1cyBiYWNrIHRvIHRoZSBzYW1lIHByb2JsZW0gd2UncmUgdHJ5aW5nIHRvIHNv
bHZlLAo+PiBzaW5jZSBpbiB0aGlzIGNhc2UgdGhlIGRyaXZlciB3b3VsZCBiZSBmb3JjZWQgdG8g
ZWl0aGVyIGZhaWwgaW1tZWRpYXRlbHkgb3IKPj4gdG8gYWxsb2NhdGUgbWVtb3J5IGF0IC5lbmNy
eXB0Ly5kZWNyeXB0IHRpbWUuCj4+Cj4gCj4gV2UgaGF2ZSB0byBwbGFjZSByZXN0cmljdGlvbnMg
b24gd2hhdCBjYXNlcwo+ICEoZmxhZ3MgJiBDUllQVE9fQUxHX0FMTE9DQVRFU19NRU1PUlkpIGFw
cGxpZXMgdG8gYW55d2F5OyBzZWUgdGhlIHBhdGNoIHRoYXQKPiBpbnRyb2R1Y2VzIGl0LiAgSWYg
bmVlZGVkIHdlIGNvdWxkIGFkZCBtb3JlIHJlc3RyaWN0aW9ucywgbGlrZSBsaW1pdCB0aGUgbnVt
YmVyCj4gb2Ygc2NhdHRlcmxpc3QgZWxlbWVudHMuICBJZiB3ZSBkaWQgdGhhdCwgdGhlIGRyaXZl
ciBjb3VsZCBhbGxvY2F0ZSBtZW1vcnkgaWYKPiB0aGUgbnVtYmVyIG9mIHNjYXR0ZXJsaXN0IGVs
ZW1lbnRzIGlzIGxhcmdlLCB3aXRob3V0IGhhdmluZyB0byBzZXQKPiBDUllQVE9fQUxHX0FMTE9D
QVRFU19NRU1PUlkuCj4gClRoaXMgc291bmRzIHJlYXNvbmFibGUuCgo+IEFsc28sIGhhdmUgeW91
IGNvbnNpZGVyZWQgdXNpbmcgYSBtZW1wb29sPyAgQSBtZW1wb29sIGFsbG93cyBhbGxvY2F0aW9u
cyB3aXRob3V0Cj4gYSBwb3NzaWJpbGl0eSBvZiBmYWlsdXJlLCBhdCB0aGUgY29zdCBvZiBwcmUt
YWxsb2NhdGlvbnMuCj4gClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uCgpXb3VsZCB0aGlzIGJl
IHNhZmUgZm9yIGFsbCBjYXNlcywgZS5nLiBJUHNlYyAtIHdoZXJlIC5lbmNyeXB0Ly5kZWNyeXB0
IGNhbGxiYWNrcwpleGVjdXRlIGluIChzb2Z0KUlSUSBjb250ZXh0PwprZXJuZWwtZG9jIGZvciBt
ZW1wb29sX2FsbG9jKCkgbWVudGlvbnMgaXQgY291bGQgZmFpbCB3aGVuIGNhbGxlZCBmcm9tCiJJ
UlEgY29udGV4dCIuIAoKVGhhbmtzLApIb3JpYQoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApk
bS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kbS1kZXZlbA==

