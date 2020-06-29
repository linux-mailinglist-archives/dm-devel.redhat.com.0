Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1910C20D0F4
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:40:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-t6ceMv9zP1ecEsErSwikMQ-1; Mon, 29 Jun 2020 14:39:49 -0400
X-MC-Unique: t6ceMv9zP1ecEsErSwikMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FD2D804016;
	Mon, 29 Jun 2020 18:39:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F9474185;
	Mon, 29 Jun 2020 18:39:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 132378789F;
	Mon, 29 Jun 2020 18:39:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TBq3tV030871 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 07:52:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3982D44116; Mon, 29 Jun 2020 11:52:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 342FE44113
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 11:52:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A4BD8007D4
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 11:52:01 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-4Uu3238UNYaIP7Hs7cTR8g-1; Mon, 29 Jun 2020 07:51:58 -0400
X-MC-Unique: 4Uu3238UNYaIP7Hs7cTR8g-1
IronPort-SDR: KhXGgmHMMb9SG+CtFZQqtGZAxoYN9wrpDFS/2sJYGbEoL6tvuMqS+bdTm5I1ky2XohrMBGpnTy
	CshMSQjiqIJzk5nvZZ031DdGewwyFkQNNv9DxrSWgp79XaqNKGh5EgCaih0O/A3RxMP97drznJ
	KIeghhPAFzB6NBUu8MV0GrroWdXC2l2mV8wwQLsQ4+OooGQbx9Y/8RW2/AAfWFv1i0Lq8r0vwO
	4+AcnTT1kFf5fJKwDDUg4Wz066L3bj2HaowxH8Ek1qJXDTNp9kyMbga4J/+IJ1zV4DYqYk5khq
	Cug=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="244196826"
Received: from mail-bn3nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.57])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 19:52:39 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN2PR04MB2141.namprd04.prod.outlook.com
	(2603:10b6:804:10::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Mon, 29 Jun 2020 11:51:53 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 11:51:53 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Tejun Heo
	<tj@kernel.org>
Thread-Topic: [PATCH 06/14] block: move the bio cgroup associatation helpers
	to blk-cgroup.c
Thread-Index: AQHWTFUu08pVkN1Cw0KGAMSZ5Pm71w==
Date: Mon, 29 Jun 2020 11:51:53 +0000
Message-ID: <SN4PR0401MB3598CB2CD25407E4E2C036299B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<20200627073159.2447325-7-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5ae21004-5992-4af0-edbe-08d81c22d108
x-ms-traffictypediagnostic: SN2PR04MB2141:
x-microsoft-antispam-prvs: <SN2PR04MB2141FB87E3D46E1561FDC7D89B6E0@SN2PR04MB2141.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 69At67BcIfvYdTKT0TLkseflVB2srWWRyGF+x2DVR09iqaX8hzsn6oXipDu2dZj4B9bNZFPTfwmn9yLdASzLiDtLcN7BAhiYIWZejcBJIexjYUp0nFO9cM1bo3DTuz2Zf19ZnEtwf70pvkvtiLsTdzGVWBls0UZnlm82qEyn+Lvs3zLf0oHe2wOpZotvIDMHzIY5o7lgdJiSjJ4JtsSZgTtWQtpTmq7D4mZqCjkRoZdkFaF011QH/0wfc/LboAUy5pi9KN7xVMnzit1OznPC63qBG8CSydIW3v/S4AGRonft2mw+WeSQFSJEuHL6TAZVJTF+lnF8zqEEYaHPAHuHhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(2906002)(55016002)(8676002)(9686003)(4270600006)(478600001)(7416002)(52536014)(33656002)(86362001)(5660300002)(71200400001)(186003)(6506007)(316002)(8936002)(66946007)(76116006)(66446008)(558084003)(91956017)(19618925003)(7696005)(66556008)(64756008)(4326008)(66476007)(110136005)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: RGPjjeMEQ3C3Wu/hVRjcsUVGvY8r1u3Zd8G4YTEsD5HNhDvqZFgkVnHp3q0rcXKpgaO0mwPRu2LRI4SNTCP/2F0XBl3VzX1arPyTc7wYFKAygNVcWoP2l3r6vRDzzygdIU1pn+yRq4hTmwrcPNa04g2Ty1yXU7aV5LBhnXZu8oy8Hv3W6AXolXmDhjlNdYuCnibChKTOIPBC5fnAGW0juI835vEkSnlfYmGgvKVIZCJ5KwZTSW2ODuUQCox81o1wJ1xkWJFTPCh1Ry3cSMP7yxlxW1FefSENvA7+YXdvzPA0BEOYhjRI1uVuC1AsNniWCpLzZE/pAINXohE8kJqFwoygOiMV5La0wEjAq4ORdAgYWikNza1cgDvqQrmWaXCRZ3Nlp/D9E2qs7+zGjUX1gXdR11ZNCTfPSWMCIrJO3MxzZmd0YrmLjMsrvc/xRFmG1SHizqrZ5+T5hy1u5sXf8VCRd1I1Eru5P2GCgkLddYnj27owP7e74fj27ddmiHY4GSgo12db35dZTGBS8BkEMZL7uDt02aNxwoDchlaxYYOulq5ylLD3U/mLrD1xPxB0
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae21004-5992-4af0-edbe-08d81c22d108
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 11:51:53.3005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1bvhzTli5C8EXlrDuPw7lYmef1F1zxqjOuLwDzWBqoWpsemymXP6oUBUAq87Ul9Ylzj6Hb0GpVALLm0oE7aPvNChpyybnwIjORJ9Eknwvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2141
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05TBq3tV030871
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Johannes, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Li Zefan <lizefan@huawei.com>, Weiner <hannes@cmpxchg.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] [PATCH 06/14] block: move the bio cgroup
 associatation helpers to blk-cgroup.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

