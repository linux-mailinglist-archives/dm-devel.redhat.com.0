Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B2D34240217
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 08:48:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-MMTEec4iPMyN9dhJq9VadQ-1; Mon, 10 Aug 2020 02:47:53 -0400
X-MC-Unique: MMTEec4iPMyN9dhJq9VadQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7517F102C7F1;
	Mon, 10 Aug 2020 06:47:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 498275D9DD;
	Mon, 10 Aug 2020 06:47:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0091A1809554;
	Mon, 10 Aug 2020 06:47:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 078L8rGf007577 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 8 Aug 2020 17:08:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED73A1108FA; Sat,  8 Aug 2020 21:08:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7DBF12567B
	for <dm-devel@redhat.com>; Sat,  8 Aug 2020 21:08:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1DF38007CB
	for <dm-devel@redhat.com>; Sat,  8 Aug 2020 21:08:50 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-68-XJK6yxL7OYWjtc6y7-31zw-1; Sat, 08 Aug 2020 17:08:46 -0400
X-MC-Unique: XJK6yxL7OYWjtc6y7-31zw-1
Received: from BN8PR06MB5714.namprd06.prod.outlook.com (2603:10b6:408:d2::32)
	by BN8PR06MB5459.namprd06.prod.outlook.com (2603:10b6:408:66::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20;
	Sat, 8 Aug 2020 21:08:45 +0000
Received: from BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9]) by
	BN8PR06MB5714.namprd06.prod.outlook.com
	([fe80::9438:86ca:efca:18b9%3]) with mapi id 15.20.3261.022;
	Sat, 8 Aug 2020 21:08:44 +0000
From: "Meneghini, John" <John.Meneghini@netapp.com>
To: Sagi Grimberg <sagi@grimberg.me>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: nvme: restore use of blk_path_error() in nvme_complete_rq()
Thread-Index: AQHWbE7UEz3pfV4MbE+GFAiYSFQMcKkr2WqAgAA6c4CAATpzAIABJjWA
Date: Sat, 8 Aug 2020 21:08:44 +0000
Message-ID: <842F6313-F3CC-46AC-A15A-A44E50C5BD18@netapp.com>
References: <20200805152905.GB1982647@dhcp-10-100-145-180.wdl.wdc.com>
	<255d55e3-f824-a968-e478-3efeda095696@huawei.com>
	<20200806142625.GA3075319@dhcp-10-100-145-180.wdl.wdc.com>
	<729820BC-5F38-4E22-A83A-862E57BAE201@netapp.com>
	<E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com> <20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
In-Reply-To: <fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.39.20071300
x-originating-ip: [216.240.30.25]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0d67c7e-f883-4f15-69da-08d83bdf3c5e
x-ms-traffictypediagnostic: BN8PR06MB5459:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR06MB545997D63020F070D68043E9E4460@BN8PR06MB5459.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vN6360j0rLNe7OBeqn5Fni8O198IwgaS1mDWta0h5PuZgrgKPN3qhdZMaKR2gBa6rKS7H5x6EZCxk7XocwOYrIxgJ8av0jk2T5fcSO3u2QHW3KXTvrstH/YvXGMXwMid6XFiHGLGD3Ss+fzy4sswLQISrkaFKfYzr1gnlvHu5cA9kgi5NHwOaml+tGuFpfIdHhn0ybEa01zvC/4+kuVWKpdEZ6h3EkcvqpopJBpnIAcIGBYkDf9sS2xCvb5ZjP5DApApdIkC72OAY3MC37k6KSBthK1ng9CPoAmU2gUXC2VHuicH35JMQAWDO/iUhfNHF4HZqUYos/uGDwmbPsSJeA2Y04lqp9C9ojrIdBLR0Z+rbDsJYsdBYEh6+MXEU71MY+hF8HDzt54AxJwce9GhAIxFy8Y27AeH137BgdnVYY5vbFZHyXl/3lJ8K5WRydO1fHgUt7QB8UYkL7JyTXrPOYK8htMzkXtVOuaPwy9CkcG1/81u7eHk/uZfUPIySs+76qNJtwwabCJlgxOQlNwQ7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BN8PR06MB5714.namprd06.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(26005)(107886003)(86362001)(30864003)(36756003)(33656002)(186003)(2906002)(83380400001)(110136005)(6512007)(478600001)(71200400001)(6486002)(316002)(8936002)(76116006)(966005)(66946007)(8676002)(6506007)(66446008)(4326008)(66476007)(91956017)(5660300002)(2616005)(66556008)(54906003)(64756008)(43620500001)(15398625002)(19623455009);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: tIbmckbEBbWiFkDscD7UzSdppeTkDvdrjhRiXCE8SMoPpgBr7kpgvsRYHLt2sgdj27Ep8GF+7jzOxjRQWLw/wGkeRqvxgUOrLOThbhDh+LNXPKLZpd47YWduwy2LG0kqvFTC+xpXe5kFe/GLfdQRJbdja1udDl1ZbPW5XlvmIyyD/WC2r6eXj59UNIjCvvStiTb0XE0TJjic/67n8t0ZRs+VukTHyhJtSYhqy8ZANucAAd/2Wi7kp9lSJwR4jJP25+L4gxaOD6/63IX2mg8oy8z/2rEFsMcc+tFdqFu6qJIiwbi5g2r2PMGjhC2Qa+NLQn/b9gMMqR3+kBR2K1Rz7mkDKn/bA2iPA6K/5j3VfnxKVACoB2++uDccGcELzrEaRDXcn6Rd1hejtRE43JY1SKaN2xN5jSDj4bVNzAJfd15zm+M8frfY5uHjJGKetD6KkAEDd/W/xdbwr/8IUCpiYyPCFxiwchf41r6J8J4vyrtKUM+Bw7RT9lPrO6lW0BXkNUveOiPrGA6IrK0ux7bPyv2h/GgH21DM0nFnhdDWWiAHPIdJGvR/4wblXmQDLCvtJvI78HF+7g0C7Ehws+xkDL6kZUXUdTBhIUHdsH/BG0TtOimsX0v7kznhRTD8pWsNsvN/Qx1ACmRRPFYAnKZIog==
Content-ID: <AB7347060257E147AF0298C5359768AD@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR06MB5714.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d67c7e-f883-4f15-69da-08d83bdf3c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2020 21:08:44.6822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x1Q+HytapLpXW4bRn2C5Su51NV18m/PJNn3Vcl9CE/pE2gP5B38fmfpyfHqHmr8WwrleiYSh/JxjT48Co0Dfuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR06MB5459
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 078L8rGf007577
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Aug 2020 02:47:26 -0400
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Ewan Milne <emilne@redhat.com>, Chao Leng <lengchao@huawei.com>,
	Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>, Keith
Subject: Re: [dm-devel] nvme: restore use of blk_path_error() in
	nvme_complete_rq()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSdkIGxpa2UgdG8gdXAgbGV2ZWwgdGhpcyB3aG9sZSBjb252ZXJzYXRpb24gZm9yIGEgbWludXRl
IGJ5IHRhbGtpbmcgYWJvdXQgZXhhY3RseSB3aGF0IEFDUkUgZG9lcy4KClRoZSBnZW5lc2lzIG9m
IHRoZSBjaGFuZ2VzIGRpc2N1c3NlZCBpbiB0aGlzIHRocmVhZCBpcyBOVk1lIFRQLTQwMzMgLSBF
bmhhbmNlZCBDb21tYW5kIFJldHJ5LiAgWW91IGNhbiBmaW5kIGEgY29weSBvZiB0aGlzIFRQIGhl
cmU6CgpodHRwOi8vbnZtZXhwcmVzcy5vcmcvd3AtY29udGVudC91cGxvYWRzL05WTS1FeHByZXNz
LTEuMy1SYXRpZmllZC1UUHMuemlwCgpUaGlzIHRlY2huaWNhbCBwcm9wb3NhbCBhZGRlZCBhIGNv
bW1hbmQgcmV0cnkgZGVsYXkgZmVhdHVyZSB3aGljaCBpcyBwcm9ncmFtbWVkIGJ5IHRoZSBjb250
cm9sbGVyLiBUaGUgY29udHJvbGxlciBhZHZlcnRpc2VzIGEgc2V0IG9mIDMgZGlmZmVyZW50IHRp
bWluZyBkZWxheXMgdGhvdWdoIHRoZSBJZGVudGlmeSBDb250cm9sbGVyIGRhdGEgc3RydWN0dXJl
IENSRFR7MS0yfSBmaWVsZHMuICBUbyBtYWtlIHVzZSBvZiB0aGVzZSBkZWxheSBmaWVsZHMgYSBu
ZXcgQ1JEIGZpZWxkIHdhcyBhZGRlZCB0byB0aGUgQ1FFIFN0YXR1cyBGaWVsZC4gIFRoaXMgYWxs
b3dzIHRoZSBOVk1lIGNvbnRyb2xsZXIgdG8gc3BlY2lmeSBleGFjdGx5IGhvdyBsb25nIGEgY29t
bWFuZCByZXRyeSBzaG91bGQgYmUgZGVsYXllZCwgd2l0aCAzIHBvc3NpYmxlIHRpbWVycyB0aGF0
IGl0IGNob29zZXMgYW5kIGNvbnRyb2xzLiAgQ1JEVHMgY2FuIHJhbmdlIGZyb20gMTAwIG1pbGxp
c2Vjb25kcyB0byA2NTU5IHNlY29uZHMuICBCZWNhdXNlIHRoaXMgY2FwYWJpbGl0eSBjYW4gaGF2
ZSBzdWNoIGEgcmFkaWNhbCBlZmZlY3Qgb24gYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgYSBuZXcg
TlZNZSBGZWF0dXJlIElkZW50aWZpZXIgd2FzIGFkZGVkIChIb3N0IEJlaGF2aW9yIFN1cHBvcnQg
LSBGZWF0dXJlIElEIDE2aCkgd2l0aCBhbiBBZHZhbmNlZCBDb21tYW5kIFJldHJ5IEVuYWJsZSAo
QUNSRSkgYml0LiAgVGhpcyBhbGxvd3MgdGhlIGhvc3QgdG8gZW5hYmxlIG9yIGRpc2FibGUgdGhl
IGZlYXR1cmUuIAoKV2l0aCB0aGlzIGJhY2tncm91bmQgdGhlcmUgYXJlIGEgY291cGxlIG9mIG1p
c2NvbmNlcHRpb25zIGluIHRoaXMgdGhyZWFkIHdoaWNoIEknZCBsaWtlIHRvIGFkZHJlc3MuICAK
ClRoZSBmaXJzdCBpczogQUNSRSBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoZSBOVk1FX1NDX0NN
RF9JTlRFUlJVUFRFRCBzdGF0dXMuICBZZXMsIHRoaXMgbmV3IGVycm9yIHN0YXR1cyB3YXMgYWRk
ZWQgYXMgYSBwYXJ0IG9mIFRQLTQwMzMgYnV0IHRoZSBDUkQgZmllbGQgb2YgdGhlIENRRSBzdGF0
dXMgY2FuIGJlIHNldCBieSB0aGUgY29udHJvbGxlciB3aXRoICphbnkqIE5WTWUgZXJyb3Igc3Rh
dHVzLiBBcyBsb25nIGFzIHRoZSBETlIgYml0IGlzIG5vdCBzZXQgdGhlIENvbW1hbmQgUmV0cnkg
RGVsYXkgY2FuIGNvbWUgaW50byBlZmZlY3QuIFRoaXMgaXMgaG93IHRoZSBzcGVjIGlzIHdyaXR0
ZW4gYW5kIHRoaXMgaXMgZXhhY3RseSBob3cgaXQgaGFzIGJlZW4gaW1wbGVtZW50ZWQgaW4gdGhl
IGNvcmUgbnZtZV9jb21wbGV0ZV9ycSgpIGZ1bmN0aW9uCihhZnRlciBjaGFuZ2UgNTA3ZmU0NmFj
OTEyNzYxMjApLiBGb3IgZXhhbXBsZSwgdGhlIGNvbnRyb2xsZXIgY2FuIHJldHVybiBOVk1FX1ND
X05TX05PVF9SRUFEWSB3aXRoIGEgQ1JEVCBvZiAyIHNlY29uZHMuXiAgU28gQ0RSVCBuZWVkcyB0
byBiZSBzdXBwb3J0ZWQgd2l0aCBhbGwgZXJyb3Igc3RhdHVzIGlmIHRoZSBob3N0IGlzIGdvaW5n
IHRvIGVuYWJsZSBBQ1JFLCBhbmQgSSB0aGluayBpdCdzIGEgYmlnIG1pc3Rha2UgdG8gZ2V0IGh1
bmcgdXAgb3ZlciB0aGUgTlZNRV9TQ19DTURfSU5URVJSVVBURUQgc3RhdHVzIHRyYW5zbGF0aW9u
LiBUaGUgTlZNRV9TQ19DTURfSU5URVJSVVBURUQgc3RhdHVzIHdhcyBvbmx5IGFkZGVkIHRvIHRo
ZSBzcGVjIHRvIHByb3ZpZGUgYSBnZW5lcmFsIHB1cnBvc2UgImJ1c3kiIHN0YXR1cywgc29tZXRo
aW5nIHRoYXQgd2FzIG1pc3NpbmcgZnJvbSBOVk1lLCBhbmQgZm9jdXNpbmcgeW91ciBzb2x1dGlv
biBvbiBOVk1FX1NDX0NNRF9JTlRFUlJVUFRFRCwgb3IgYW55IG90aGVyIHNwZWNpZmljIE5WTWUg
ZXJyb3Igc3RhdHVzLCBpcyB0aGUgd3JvbmcgdGhpbmcgdG8gZG8uICBUaGVyZSBpcyBhIG11Y2gg
bGFyZ2VyIGNoYW5nZSBpbiBlcnJvciBzZW1hbnRpY3MgZ29pbmcgb24gd2l0aCBBQ1JFIHRoYW4g
anVzdCB0aGlzIHNpbmdsZSBlcnJvci4KClRoZSBzZWNvbmQgaXM6ICBBbGwgTlZNZSBlcnJvciBz
dGF0dXMgdGhhdCBkbyBub3QgaGF2ZSBhIFN0YXR1cyBDb2RlIFR5cGUgb2YgM2ggKFBhdGggUmVs
YXRlZCBTdGF0dXMpIGFyZSBzdWJzeXN0ZW0gc2NvcGVkLiBUaGlzIGlzIGEgdG9waWMgdGhhdCBo
YXMgZ29uZSB0aHJvdWdoIHNvbWUgZGViYXRlIG9uIHRoZSBsaW51eC1udm1lIG1haWxpbmcgbGlz
dCBhbmQgYXQgTlZNZXhwcmVzcy5vcmc7IGFuZCB0aGVyZSBoYXZlIGJlZW4gc29tZSBFQ05zIHRv
IHRoZSBzcGVjIHRvIGFkZHJlc3MgdGhpcy4gVGhlcmUgbWF5IGJlIHNvbWUgZXhjZXB0aW9ucyB0
byB0aGlzIHJ1bGUgYmVjYXVzZSB0aGVyZSBhcmUgYWx3YXlzIGltcGxlbWVudGF0aW9ucyBvdXQg
dGhlcmUgdGhhdCBtYXkgbm90IGZvbGxvdywgYW5kIHRoZXJlIGFyZSBidWdzIGluIHRoZSBzcGVj
LiAgSG93ZXZlciwgdGhpcyBpcyB0aGUgaW50ZW50aW9uIG9mIHRoZSBOVk1lIHNwZWMgYW5kIGl0
IG1hdHRlcnMuIFRoaXMgbWVhbnMgdGhhdCwgaW4gYSBtdWx0aS1wYXRoaW5nIGVudmlyb25tZW50
LCByZXRyeWluZyBhbnkgY29tbWFuZCBvbiBhIGRpZmZlcmVudCBwYXRoIHdpbGwgbm90IHByb3Zp
ZGUgYSBkaWZmZXJlbnQgcmVzdWx0LiBSZXRyaWVzIHNob3VsZCBhbGwgb2NjdXIgb24gdGhlIHNh
bWUgY29udHJvbGxlciAtIHVubGVzcyBpdCBpcyBhIHBhdGggcmVsYXRlZCBzdGF0dXMuICBUaGlz
IGlzIGhvdyBOVk1lIGVycm9yIHNlbWFudGljcyB3b3JrIGFuZCB0aGlzIGlzIGEgcGFydCBvZiB3
aGF0IHdhcyBiZWhpbmQgS2VpdGgncyBwYXRjaCAuIAoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPTM1MDM4
YmZmYTg3ZGEKClJldHJ5aW5nIE5WTUVfU0NfTlNfTk9UX1JFQURZIG9yIE5WTUVfU0NfQ01EX0lO
VEVSUlVQVEVEIG9uIGFub3RoZXIgcGF0aCBpcyBzaW1wbHkgbm90IHRoZSByaWdodCB0aGluZyB0
byBkbywgYW5kIHJldHVybmluZyBCTEtfU1RTX1RBUkdFVCBhZnRlciBhbGwgY29tbWFuZCByZXRy
aWVzLCB3aXRoIENSRFQsIGhhdmUgYmVlbiBleGhhdXN0ZWQgY29tbXVuaWNhdGVzIHRoZSByaWdo
dCB0aGluZyB0byB0aGUgdXBwZXIgbGF5ZXIuIEZyb20gdGhlIHBlcnNwZWN0aXZlIG9mIG52bWUt
bXVsdGlwYXRoaW5nIEtlaXRoJ3MgcGF0Y2ggd2FzIGV4YWN0bHkgdGhlIGNvcnJlY3QgdGhpbmcg
dG8gZG8uICBJIHVuZGVyc3RhbmQgdGhhdCB0aGlzIG1heSBoYXZlIGNhdXNlZCBhIGJhY2t3YXJk
cyBjb21wYXRpYmx5IHByb2JsZW0gd2l0aCBkbS1tdWx0aXBhdGgsIGFuZCB0aGF0J3MgdGhlIG9u
bHkgcmVhc29uIHdoeSBJJ3ZlIHRhbGtlZCBhYm91dCBiYWNraW5nIGl0IG91dC4gIEhvd2V2ZXIs
IHVsdGltYXRlbHksIEkgdGhpbmsgbnZtZS1jb3JlIHNob3VsZCByZXR1cm4gYW4gZXJyb3Igc3Rh
dHVzIGxpa2UgIEJMS19TVFNfVEFSR0VUIHRoYXQgc2F5cywgc2VtYW50aWNhbGx5IC0gdGhlIElP
IGhhcyBmYWlsZWQsIG5vIHJldHJ5IHdpbGwgd29yayAtIGJlY2F1c2UgdGhpcyBpcyB3aGF0IHRo
ZSBOVk1lIGVycm9yIHNlbWFudGljcyBhcmUuCgpUYWtlbiB0b2dldGhlciBib3RoIG9mIHRoZXNl
IGZhY3RzIGFib3V0IHRoZSBOVk1lIHByb3RvY29sIHNlbWFudGljcyBhcmUgd2hhdCdzIGJlaGlu
ZCBteSBwYXRjaCB3aGljaCByZW1vdmVkIGJsa19wYXRoX2Vycm9yKCkgZnJvbSBudm1lX2NvbXBs
ZXRlX3JxKCkKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD03NjRlOTMzMjA5OGMwZTYwMjUxMzg2YTUwN2Zl
NDZhYzkxMjc2MTIwCgpJIHVuZGVyc3RhbmQgdGhhdCB0aGVyZSBpcyBhIGdvYWwgdG8gdHJ5IGFu
ZCBhdm9pZCBoYXZpbmcgZGlmZmVyZW50IGZhaWx1cmUvcmVjb3ZlcnkgaGFuZGxpbmcgc2VtYW50
aWNhbGx5IGluIHJlc3BvbnNlIHRvIGRpZmZlcmVudCBlcnJvciBzdGF0dXMgYmV0d2VlbiBudm1l
LW11bHRpcGF0aCBhbmQgZG0tbXVsdGlwYXRoLCBidXQgTlZNZSBlcnJvciBzZW1hbnRpY3MgYXJl
IHRydWx5IGRpZmZlcmVudCBmcm9tIFNDU0kgZXJyb3Igc2VtYW50aWNzLCBhbmQgdGhleSBhcmUg
Y2hhbmdpbmcuIFRoZSBMaW51eCBob3N0IG5lZWRzIHRvIGVuYWJsZSBhbmQgc3VwcG9ydCB0aG9z
ZSBjaGFuZ2VzIHVuaGFtcGVyZWQgYnkgdGhlIHBhc3QuIFdpdGggdGhpcyBnb2FsIGluIG1pbmQs
IHJlbW92aW5nIHRoZSBibGtfcGF0aF9lcnJvcigpIGNvZGUgZnJvbSBudm1lLWNvcmUgd2FzIHRo
ZSByaWdodCB0aGluZyB0byBkby4gIEhhbm5lcyBhbmQgSSBzdHJ1Z2dsZWQgd2l0aCB0aGUgcGF0
Y2ggdG8gdHJ5IGFuZCBtYWtlIGl0IHdvcmsgd2l0aCBibGtfcGF0aF9lcnJvcigpIGZvciB3ZWVr
cy4gIEFzIHBvaW50ZWQgb3V0IGluIHRoZSB0aHJlYWQgYmVsb3csIGJsa19wYXRoX2Vycm9yKCkg
aXMgdGhlIFNDU0kgbXVsdGlwYXRoaW5nIGxvZ2ljIGFuZCB3ZSBjYW4ndCB1c2UgaXQgaW4gbnZt
ZV9jb21wbGV0ZV9ycSgpLiAgQWxsIGl0IGRvZXMgaXMgaW1wb3J0IGFsbCBvZiB0aGUgbGVnYWN5
IHByb2JsZW1zIG9mIGRtLW11bHRpcGF0aCwgYW5kIG9mIFNDU0ksIGludG8gdGhlIG52bWUgY29t
cGxldGlvbi9tdWx0aXBhdGggbG9naWMuICAKCkF0IE5WTWV4cHJlc3Mub3JnIHdlIGNvbnNjaW91
c2x5IGFkZGVkIHRoZSBBQ1JFIGZlYXR1cmUgYmVjYXVzZSB0aGUgU0NTSSBwcm90b2NvbCBoYWQg
bm8gc3VjaCBjYXBhYmlsaXR5LiAgVGhpcyBpcyBzb21ldGhpbmcgd2hpY2ggaGFzIHBsYWd1ZWQg
U0NTSSBpbXBsZW1lbnRhdGlvbnMgZm9yIHllYXJzLCAgYW5kIGFsbCBraW5kcyBvZiB0cmlja3Mg
aGF2ZSBiZWVuIHBsYXllZCwgaW4gYm90aCB0aGUgU0NTSSBob3N0IHN0YWNrIGFuZCBpbiBTQ1NJ
IHRhcmdldCBzdGFjaywgdG8gZGVhbCB3aXRoIHRoZSBwcm9ibGVtLiBUaGUgZ29hbCBvZiBOVk1l
IGlzIHRvIGNyZWF0ZSBhIGJldHRlciBibG9jayBzdG9yYWdlIHByb3RvY29sIGFuZCBBQ1JFIGlz
IGp1c3Qgb25lIGV4YW1wbGUgb2YgbWFueSBwbGFjZXMgd2hlcmUgdGhlIGluZHVzdHJ5IGlzIHRy
eWluZyB0byBkbyB0aGlzLiAgVGhlcmUgYXJlIHBsYW5zIHRvIGludHJvZHVjZSBtb3JlIEhvc3Qg
QmVoYXZpb3IgU3VwcG9ydCBmZWF0dXJlcyBpbiB0aGUgZnV0dXJlLiAgCgpJbiB0aGUgZW5kLCB3
ZSBhcmUgY29uc2Npb3VzbHkgY2hhbmdpbmcgTlZNZSwgYm90aCBpbiB0aGUgc3BlYyBhbmQgaW4g
aXRzIGltcGxlbWVudGF0aW9uLCB0byBtYWtlIGl0IGRpZmZlcmVudCBmcm9tIFNDU0kuIEkgdGhp
bmsgdGhpcyBpcyB3aGF0J3MgYXQgdGhlIGJvdHRvbSBvZiB0aGUgY2hhbmdlcyBkaXNjdXNzZWQg
aW4gdGhpcyB0aHJlYWQsIGFuZCB0aGlzIGlzIHdoeSBzbyBtYW55IHBlb3BsZSBhcmUgc28gcGFz
c2lvbmF0ZSBhYm91dCB0aGlzLiAgV2UgZG9uJ3Qgd2FudCB0byB0dXJuIE5WTWUgaW50byBTQ1NJ
LiAgSSBrbm93IEkgZG9uJ3Qgd2FudCB0by4KCi9Kb2huCgpeTm90ZTogKG1heWJlIGEgMiBzZWNv
bmQgZGVsYXkgc291bmRzIHVucmVhc29uYWJsZSBmb3IgYSBmbGFzaCBzdG9yYWdlIGRldmljZSBi
dXQgdGhlcmUgaW1wbGVtZW50b3JzIHRoYXQgdGhhdCB3YW50IHRvIHVzZSBOVk1lIHdpdGggc3Bp
bm5pbmcgZGlza3MuLi4gc28gdGhlIENEUlQgZ2l2ZXMgdGhlbSBleGFjdGx5IHdoYXQgdGhleSBu
ZWVkKS4gIAoK77u/T24gOC83LzIwLCA3OjM1IFBNLCAiU2FnaSBHcmltYmVyZyIgPHNhZ2lAZ3Jp
bWJlcmcubWU+IHdyb3RlOgoKICAgID4+IEhleSBNaWtlLAogICAgPj4KICAgID4+Pj4gVGhlIHBv
aW50IGlzOiBibGtfcGF0aF9lcnJvcigpIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggTlZNZSBlcnJv
cnMuCiAgICA+Pj4+IFRoaXMgaXMgZG0tbXVsdGlwYXRoIGxvZ2ljIHN0dWNrIGluIHRoZSBtaWRk
bGUgb2YgdGhlIE5WTWUgZXJyb3IKICAgID4+Pj4gaGFuZGxpbmcgY29kZS4KICAgID4+PgogICAg
Pj4+IE5vLCBpdCBpcyBhIG1lYW5zIHRvIGhhdmUgbXVsdGlwbGUgc3Vic3lzdGVtcyAodG8gdGhp
cyBwb2ludCBib3RoIFNDU0kKICAgID4+PiBhbmQgTlZNZSkgZG9pbmcgdGhlIGNvcnJlY3QgdGhp
bmcgd2hlbiB0cmFuc2xhdGluZyBzdWJzeXN0ZW0gc3BlY2lmaWMKICAgID4+PiBlcnJvciBjb2Rl
cyB0byBCTEtfU1RTIGNvZGVzLgogICAgPj4KICAgID4+IE5vdCBleGFjdGx5LCBkb24ndCBmaW5k
IGFueSB1c2Ugb2YgdGhpcyBpbiBzY3NpLiBUaGUgcHVycG9zZSBpcyB0byBtYWtlCiAgICA+PiBz
dXJlIHRoYXQgbnZtZSBhbmQgZG0gc3BlYWsgdGhlIHNhbWUgbGFuZ3VhZ2UuCiAgICA+CiAgICA+
IFNDU0kgZG9lc24ndCBuZWVkIHRvIGRvIGFkZGl0aW9uYWwgd29yayB0byB0cmFpbiBhIG11bHRp
cGF0aCBsYXllcgogICAgPiBiZWNhdXNlIGRtLW11bHRpcGF0aCBfaXNfIFNDU0kncyBtdWx0aXBh
dGhpbmcgaW4gTGludXguCgogICAgQWdyZWUuCgogICAgPiBTbyBlbnN1cmluZyBTQ1NJIHByb3Bl
cmx5IGNsYXNzaWZpZXMgaXRzIGVycm9yIGNvZGVzIGhhcHBlbnMgYXMgYQogICAgPiBzaWRlLWVm
ZmVjdCBvZiBlbnN1cmluZyBjb250aW51ZWQgbXVsdGlwYXRoIGZ1bmN0aW9uYWxpdHkuCiAgICA+
CiAgICA+IEhhbm5lcyBpbnRyb2R1Y2VkIGFsbCB0aGVzZSBkaWZmZXJlbnRpYXRlZCBlcnJvciBj
b2RlcyBpbiBibG9jayBjb3JlCiAgICA+IGJlY2F1c2Ugb2YgU0NTSS4gIE5WTWUgaXMgbWVhbnQg
dG8gYnVpbGQgb24gdGhlIGluZnJhc3RydWN0dXJlIHRoYXQgd2FzCiAgICA+IGVzdGFibGlzaGVk
LgoKICAgIFllcywgZXhhY3RseSBteSBwb2ludC4gYmxrX3BhdGhfZXJyb3IgaXMgZGVzaWduZWQg
dG8gbWFrZSBudm1lIGFuZAogICAgZG0tbXVsdGlwYXRoIHNwZWFrIHRoZSBzYW1lIGxhbmd1YWdl
LgoKICAgID4+PiBJZiB5b3UsIG9yIG90aGVycyB5b3UgbmFtZSBkcm9wIGJlbG93LCB1bmRlcnN0
b29kIHRoZSBwb2ludCB3ZSB3b3VsZG4ndAogICAgPj4+IGJlIGhhdmluZyB0aGlzIGNvbnZlcnNh
dGlvbi4gIFlvdSdkIGFjY2VwdCB0aGUgcG9pbnQgb2YgYmxrX3BhdGhfZXJyb3IoKQogICAgPj4+
IHRvIGJlIHZhbGlkIGFuZCByZXF1aXJlZCBjb2RpZmljYXRpb24gb2Ygd2hhdCBjb25zdGl0dXRl
cyBhIHJldHJ5YWJsZQogICAgPj4+IHBhdGggZXJyb3IgZm9yIHRoZSBMaW51eCBibG9jayBsYXll
ci4KICAgID4+CiAgICA+PiBUaGlzIGluY2lkZW50IGlzIGEgY2FzZSB3aGVyZSB0aGUgc3BlY2lm
aWMgbnZtZSBzdGF0dXMgd2FzIGRlc2lnbmVkCiAgICA+PiB0byByZXRyeSBvbiB0aGUgc2FtZSBw
YXRoIHJlc3BlY3RpbmcgdGhlIGNvbnRyb2xsZXIgcmV0cnkgZGVsYXkuCiAgICA+PiBBbmQgYmVj
YXVzZSBudm1lIHVzZWQgYmxrX3BhdGhfZXJyb3IgYXQgdGhlIHRpbWUgaXQgY2F1c2VkIHVzIHRv
IHVzZSBhCiAgICA+PiBub24tcmV0cnlhYmxlIHN0YXR1cyB0byBnZXQgYXJvdW5kIHRoYXQuIEdy
YW50ZWQsIG5vIG9uZSBoYWQKICAgID4+IGRtLW11bHRpcGF0aCBpbiBtaW5kLgogICAgPj4KICAg
ID4+IFNvIGluIGEgc2Vuc2UsIHRoZXJlIGlzIGNvbnNlbnN1cyBvbiBjaGFuZ2luZyBwYXRjaCAz
NTAzOGJmZmE4N2RhCiAgICA+PiBfYmVjYXVzZV8gbnZtZSBubyBsb25nZXIgdXNlcyBibGtfcGF0
aF9lcnJvci4gT3RoZXJ3aXNlIGl0IHdvdWxkIGJyZWFrLgogICAgPgogICAgPiAiYnJlYWsiIG1l
YW5pbmcgaXQgd291bGQgZG8gZmFpbG92ZXIgaW5zdGVhZCBvZiB0aGUgbW9yZSBvcHRpbWFsIGxv
Y2FsCiAgICA+IHJldHJ5IHRvIHRoZSBzYW1lIGNvbnRyb2xsZXIuCiAgICA+CiAgICA+IEkgc2Vl
LiAgV2lzaCB0aGUgaGVhZGVyIGZvciBjb21taXQgMzUwMzhiZmZhODdkYSB0b3VjaGVkIG9uIHRo
aXMgZXZlbiBhCiAgICA+IGxpdHRsZSBiaXQgOykKCiAgICBJIHRoaW5rIGl0IGRpZCwgYnV0IG1h
eWJlIGRpZG4ndCBwdXQgdG9vIG11Y2ggZW1waGFzaXMgb24gaXQuCgogICAgPiBCdXQgQUZBSUNU
IHRoZSBwYXRjaCBJIHByb3ZpZGVkIGRvZXNuJ3QgY29tcHJvbWlzZSBwcm9wZXIgbG9jYWwgcmV0
cnkgLS0KICAgID4gYXMgbG9uZyBhcyB3ZSBmaXJzdCBmaXggbnZtZV9lcnJvcl9zdGF0dXMoKSB0
byByZXR1cm4gYSByZXRyeWFibGUKICAgID4gQkxLX1NUUyBmb3IgTlZNRV9TQ19DTURfSU5URVJS
VVBURUQgLS0gd2hpY2ggSSBhc3N1bWVkIGFzIGEgcHJlcmVxLgogICAgPgogICAgPiBUaGluayBv
ZiBibGtfcGF0aF9lcnJvcigpIGFzIGEgbW9yZSBjb2Fyc2UtZ3JhaW5lZCAiaXMgdGhpcyByZXRy
eWFibGUgb3IKICAgID4gYSBoYXJkIGZhaWx1cmU/IiBjaGVjay4gIFNvIGZvciBOVk1FX1NDX0NN
RF9JTlRFUlJVUFRFRCwKICAgID4gbnZtZV9lcnJvcl9zdGF0dXMoKSBfc2hvdWxkXyByZXNwb25k
IHdpdGggc29tZXRoaW5nIHJldHJ5YWJsZSAoSSdkCiAgICA+IHByZWZlciBCTEtfU1RTX1JFU09V
UkNFIHRvIGJlIGhvbmVzdCkuCgogICAgQnV0IGJsa19wYXRoX2Vycm9yIHNlbWFudGljYWxseSBt
ZWFuICJpcyB0aGlzIGEgcGF0aGluZyBlcnJvciIsIG9yIGF0CiAgICBsZWFzdCB0aGF0IHdoYXQg
aXRzIG5hbWUgc3VnZ2VzdC4KCiAgICA+IEFuZCB0aGVuIG52bWVfZmFpbG92ZXJfcmVxKCkgaXMg
ZmluZXItZ3JhaW5lZDsgYnkgcmV0dXJuaW5nIGZhbHNlIGl0IG5vdwogICAgPiBhbGxvd3Mgc2hv
cnQtY2lyY3VpdGluZyBmYWlsb3ZlciBhbmQgcmV2ZXJ0aW5nIGJhY2sgdG8gTlZNZSdzIG5vcm1h
bAogICAgPiBjb250cm9sbGVyIGJhc2VkIGVycm9yIHJlY292ZXJ5IC0tIHdoaWNoIGl0IGRvZXMg
Zm9yCiAgICA+IE5WTUVfU0NfQ01EX0lOVEVSUlVQVEVEIGR1ZSB0byAiZGVmYXVsdCIgY2FzZSBp
biBudm1lX2ZhaWxvdmVyX3JlcSgpLgogICAgPgogICAgPiBBbmQgdGhlbiB0aGUgcHJldmlvdXMg
bnZtZV9lcnJvcl9zdGF0dXMoKSBjbGFzc2lmaWNhdGlvbiBvZiByZXRyeWFibGUKICAgID4gQkxL
X1NUUyBvYnZpb3VzbHkgbmV2ZXIgZ2V0cyByZXR1cm5lZCB1cCB0aGUgSU8gc3RhY2s7IGl0IGdl
dHMgdGhyb3duCiAgICA+IGF3YXkuCgogICAgSSBzZWUgd2hhdCB5b3UgYXJlIHNheWluZy4gVGhl
IGlzc3VlIGlzIHRoYXQgdGhlIGNvZGUgYmVjb21lcwogICAgY29udm9sdXRlZCAoaXQncyBhIHBh
dGhpbmcgZXJyb3IsIG9oIHdhaXQsIG5vIGl0cyBub3QgYSBwYXRoaW5nIGVycm9yKS4KCiAgICA+
Pj4gQW55IEJMS19TVFMgbWFwcGluZyBvZiBOVk1lIHNwZWNpZmljIGVycm9yIGNvZGVzIHdvdWxk
IG5lZWQgdG8gbm90IHNjcmV3CiAgICA+Pj4gdXAgYnkgY2F0ZWdvcml6aW5nIGEgcmV0cnlhYmxl
IGVycm9yIGFzIG5vbi1yZXRyeWFibGUgKGFuZCB2aWNlLXZlcnNhKS4KICAgID4+CiAgICA+PiBC
dXQgaXQgaXMgYSBzcGVjaWFsIHR5cGUgb2YgcmV0cnlhYmxlLiBUaGVyZSBpcyBub3RoaW5nIHRo
YXQgZml0cyB0aGUKICAgID4+IHNlbWFudGljcyBvZiB0aGUgY3VycmVudCBiZWhhdmlvci4KICAg
ID4KICAgID4gSSBhZ3JlZS4gIEJ1dCB0aGF0J3MgZmluZSBhY3R1YWxseS4KICAgID4KICAgID4g
QW5kIHRoaXMgaXNzdWUgaXMgdGhlIHBvc3Rlci1jaGlsZCBmb3Igd2h5IHByb3Blcmx5IHN1cHBv
cnRpbmcgYSBkdWFsaXR5CiAgICA+IG9mIGRyaXZlci1sZXZlbCB2cyB1cHBlciBsZXZlbCBtdWx0
aXBhdGhpbmcgY2FwYWJpbGl0aWVzIGlzIHByZXR0eSBtdWNoCiAgICA+IGltcG9zc2libGUgdW5s
ZXNzIGEgY2xlYW4gZGVzaWduIGZhY3RvcnMgb3V0IHRoZSBkaWZmZXJlbnQgZXJyb3IgY2xhc3Nl
cwogICAgPiAtLSBhbmQgbG9jYWwgZXJyb3IgcmV0cnkgaXMgaGFuZGxlZCBiZWZvcmUgcHVudGlu
ZyB0byBoaWdoZXIgbGV2ZWwKICAgID4gZmFpbG92ZXIgcmV0cnkuICBUaGluayBpZiBOVk1lIHdl
cmUgdG8gYWRvcHQgYSBiaXQgbW9yZSBkaXNjaXBsaW5lZAogICAgPiAibG9jYWwgdGhlbiBmYWls
b3ZlciIgZXJyb3IgaGFuZGxpbmcgaXQgYWxsIGdldHMgZWFzaWVyLgoKICAgIEkgZG9uJ3QgdGhp
bmsgcHVudGluZyBiZWZvcmUgaXMgZWFzaWVyLCBiZWNhdXNlIHdlIGRvIGEgbG9jYWwgcmV0cnkg
aWY6CiAgICAtIG5vIG11bHRpcGF0aGluZyBzdyBvbiB0b3AKICAgIC0gcmVxdWVzdCBuZWVkcyBy
ZXRyeSAoZS5nLiBubyBETlIsIG5vdHJldHJ5IGlzIG9mZiBldGMuLikKICAgIC0gbnZtZSBlcnJv
ciBpcyBub3QgcGF0aGluZyByZWxhdGVkIChudm1lX2ZhaWxvdmVyX3JlcSByZXR1cm5lZCBmYWxz
ZSkKCiAgICA+IFRoaXMgbG9jYWwgcmV0cnkgX2lzXyBOVk1lIHNwZWNpZmljLiAgTlZNZSBzaG91
bGQganVzdCBvd24gcmV0cnlpbmcgb24KICAgID4gdGhlIHNhbWUgY29udHJvbGxlciBubyBtYXR0
ZXIgd2hhdCAoSSdsbCBob3BlIHRoYXQgc3VjaCByZXRyeSBoYXMKICAgID4gYXdhcmVuZXNzIHRv
IG5vdCByZXRyeSBpbmRlZmluaXRlbHkgdGhvdWdoISkuCgogICAgaXQgd2lsbCByZXRyeSB1bnRp
bCB0aGUgcmV0cnkgbGltaXQuCgogICAgPiAgQW5kIHRoaXMgaGFzIG5vdGhpbmcgdG8KICAgID4g
ZG8gd2l0aCBtdWx0aXBhdGhpbmcsIHNvIHRoZSBsb2dpYyB0byBoYW5kbGUgaXQgc2hvdWxkbid0
IGJlIHRyYXBwZWQgaW4KICAgID4gbnZtZV9mYWlsb3Zlcl9yZXEoKS4KCiAgICBXZWxsIGdpdmVu
IHRoYXQgbnZtZV9mYWlsb3Zlcl9yZXEgYWxyZWFkeSBtYXkgbm90IGFjdHVhbGx5IGZhaWxvdmVy
IHRoaXMKICAgIG1ha2VzIHNvbWUgc2Vuc2UgdG8gbWUgKGFsdGhvdWdoIEkgZGlkIGhhdmUgc29t
ZSByZXNpc3RhbmNlIHRvIG1ha2UgaXQKICAgIHRoYXQgd2F5IGluIHRoZSBmaXJzdCBwbGFjZSwg
YnV0IHdhcyBjb252aW5jZWQgb3RoZXJ3aXNlKS4KCiAgICA+IEkgdGhpbmsgTlZNZSBjYW4gZWFz
aWx5IGZpeCB0aGlzIGJ5IGhhdmluZyBhbiBlYXJsaWVyIHN0YWdlIG9mIGNoZWNraW5nLAogICAg
PiBlLmcuIG52bWVfbG9jYWxfcmV0cnlfcmVxKCksIHRoYXQgc2hvcnRjaXJjdWl0cyBldmVyIGdl
dHRpbmcgdG8KICAgID4gaGlnaGVyLWxldmVsIG11bHRpcGF0aGluZyBjb25zaWRlcmF0aW9uIChi
ZSBpdCBuYXRpdmUgTlZNZSBvciBETQogICAgPiBtdWx0aXBhdGhpbmcpIGZvciBjYXNlcyBsaWtl
IE5WTUVfU0NfQ01EX0lOVEVSUlVQVEVELgogICAgPiBUbyBiZSBjbGVhcjogdGhlICJkZWZhdWx0
IiBjYXNlIG9mIG52bWVfZmFpbG92ZXJfcmVxKCkgdGhhdCByZXR1cm5zCiAgICA+IGZhbHNlIHRv
IGZhbGxiYWNrIHRvIE5WTWUncyAibG9jYWwiIG5vcm1hbCBOVk1lIGVycm9yIGhhbmRsaW5nIC0t
IHRoYXQKICAgID4gY2FuIHN0YXkuLiBidXQgYSBtb3JlIGV4cGxpY2l0IGhhbmRsaW5nIG9mIGNh
c2VzIGxpa2UKICAgID4gTlZNRV9TQ19DTURfSU5URVJSVVBURUQgc2hvdWxkIGJlIGFkZGVkIHRv
IGEgbnZtZV9sb2NhbF9yZXRyeV9yZXEoKQogICAgPiBjaGVjayB0aGF0IGhhcHBlbnMgYmVmb3Jl
IG52bWVfZmFpbG92ZXJfcmVxKCkgaW4gbnZtZV9jb21wbGV0ZV9ycSgpLgoKICAgIEkgZG9uJ3Qg
bmVjZXNzYXJpbHkgYWdyZWUgd2l0aCBoYXZpbmcgYSBkZWRpY2F0ZWQgbnZtZV9sb2NhbF9yZXRy
eV9yZXEoKS4KICAgIGEgcmVxdWVzdCB0aGF0IGlzbid0IGZhaWxlZCBvdmVyLCBnb2VzIHRvIGxv
Y2FsIGVycm9yIGhhbmRsaW5nIChyZXRyeSBvcgogICAgbm90KS4gSSBhY3R1YWxseSB0aGluayB0
aGF0IGp1c3QgYWRkaW5nIHRoZSBjb25kaXRpb24gdG8KICAgIG52bWVfY29tcGxldGVfcmVxIGFu
ZCBoYXZpbmcgbnZtZV9mYWlsb3Zlcl9yZXEgcmVqZWN0IGl0IHdvdWxkIHdvcmsuCgogICAgS2Vp
dGg/CgogICAgPj4+IEFueXdheSwgbm8gbmV3IEJMS19TVFMgaXMgbmVlZGVkIGF0IHRoaXMgcG9p
bnQuICBNb3JlIGRpc2NpcGxpbmUgd2l0aAogICAgPj4+IGhvdyBOVk1lJ3MgZXJyb3IgaGFuZGxp
bmcgaXMgY2hhbmdlZCBpcy4KICAgID4+CiAgICA+PiBQbGVhc2UgcmVhZCB0aGUgYWJvdmUuCiAg
ICA+CiAgICA+IEkgYWdyZWUgd2UnZCBuZWVkIGEgbmV3IEJMS19TVFMgb25seSBpZiBOVk1lIGNh
bm5vdCBiZSBtYWRlIHRvIHRyYXAKICAgID4gTlZNRV9TQ19DTURfSU5URVJSVVBURUQgZm9yIGxv
Y2FsIHJldHJ5IF9iZWZvcmVfIGNvbnNpZGVyaW5nIHBhdGgKICAgID4gZmFpbG92ZXIuCgogICAg
Tm90IHN1cmUgdGhhdCBpcyBiZXR0ZXIsIGJ1dCB3ZSBjYW4gc2VlIGEgcGF0Y2ggZmlyc3QgdG8g
ZGV0ZXJtaW5lLgoKICAgID4+PiBJZiBOVk1lIHdhbnRzIHRvIGVuc3VyZSBpdHMKICAgID4+PiBp
bnRlcmZhY2UgaXNuJ3QgYnJva2VuIHJlZ3VsYXJseSBpdCBfc2hvdWxkXyB1c2UgYmxrX3BhdGhf
ZXJyb3IoKSB0bwogICAgPj4+IHZhbGlkYXRlIGZ1dHVyZSBudm1lX2Vycm9yX3N0YXR1cygpIGNo
YW5nZXMuICBNaXNjYXRlZ29yaXppbmcgTlZNZQogICAgPj4+IGVycm9ycyB0byB1cHBlciBsYXll
cnMgaXMgYSBidWcgLS0gbm90IG9wZW4gZm9yIGRlYmF0ZS4KICAgID4+CiAgICA+PiBBZ2Fpbiwg
ZG9uJ3QgYWdyZWUgaXMgYSBNaXNjYXRlZ29yaXphdGlvbiBub3IgYSBidWcsIGl0cyBqdXN0IHNv
bWV0aGluZwogICAgPj4gdGhhdCBpcyBOVk1lIHNwZWNpZmljLgogICAgPgogICAgPiBSaWdodCBJ
IHVuZGVyc3RhbmQuCiAgICA+CiAgICA+IFRoaW5rIGl0IHNhZmUgdG8gYXNzdW1lIHRoZXNlIHR5
cGVzIG9mIGRldGFpbHMgYXJlIHdoeSBDaHJpc3RvcGggd2FudGVkCiAgICA+IHRvIGF2b2lkIHRo
ZSBub3Rpb24gb2YgbmF0aXZlIE5WTWUgYW5kIERNIG11bHRpcGF0aGluZyBoYXZpbmcKICAgID4g
Y29tcGF0aWJsZSBlcnJvciBoYW5kbGluZy4gIFRoZXJlIHdhcyBzb21lIHdpc2RvbSB3aXRoIHRo
YXQgcG9zaXRpb24KICAgID4gKGVzcGVjaWFsbHkgd2l0aCBuYXRpdmUgTlZNZSBnb2FscyBpbiBt
aW5kKS4gIEJ1dCBpZiB0aGluZ3MgYXJlIHR3ZWFrZWQKICAgID4gc2xpZ2h0bHkgdGhlbiBib3Ro
IGNhbXBzIF9jYW5fIGJlIG1hZGUgaGFwcHkuCiAgICA+CiAgICA+IFRoZXJlIGp1c3QgbmVlZHMg
dG8gYmUgYSB3aWxsaW5nbmVzcyB0byB3b3JrIHRocm91Z2ggdGhlIGRldGFpbHMsCiAgICA+IGRl
ZmVuc2l2ZW5lc3MgbmVlZHMgdG8gYmUgc2hlZCBvbiBib3RoIHNpZGVzLCBzbyBjb25zdHJ1Y3Rp
dmUKICAgID4gcmV2aWV3L2NvbnNpZGVyYXRpb24gb2YgcHJvYmxlbXMgY2FuIGhhcHBlbi4KCiAg
ICBBZ3JlZWQuCgogICAgPiBUaGluayB0aGF0IGhhcyBhbHJlYWR5CiAgICA+IGhhcHBlbmVkIGhl
cmUgd2l0aCBvdXIgZXhjaGFuZ2UuICBJJ20gb3BlbiB0byBpbnZlc3RpbmcgZWZmb3J0IGhlcmUg
aWYKICAgID4gb3RoZXJzIGFyZSB1cCBmb3IgaHVtb3JpbmcgbXkgYXR0ZW1wdCB0byBleHBsb3Jl
IGZpeGluZyB0aGUgaXNzdWVzIGluIGEKICAgID4gbXV0dWFsbHkgYmVuZWZpY2lhbCB3YXkuICBX
aGF0J3MgdGhlIHdvcnN0IHRoYXQgY2FuIGhhcHBlbj8gIE15IHNpbXBsZQogICAgPiBwYXRjaGVz
IG1pZ2h0IGNvbnRpbnVlIHRvIGJlIGlnbm9yZWQ/IDspCgogICAgSSB3b24ndCBpZ25vcmUgaXQs
IGFuZCBJIGFwb2xvZ2l6ZSBvZiBpZ25vcmluZyB0aGUgb3JpZ2luYWwgcGF0Y2gKICAgIHBvc3Rl
ZCwgSSBndWVzcyBpdCBmbGV3IHVuZGVyIHRoZSByYWRhci4uLgoKCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbA==

