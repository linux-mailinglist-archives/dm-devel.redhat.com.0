Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD8F20D0EF
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-X6Kl1EJuOnWn4gS3wm92Ww-1; Mon, 29 Jun 2020 14:39:47 -0400
X-MC-Unique: X6Kl1EJuOnWn4gS3wm92Ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7A3F8015F9;
	Mon, 29 Jun 2020 18:39:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94B3D5D9D3;
	Mon, 29 Jun 2020 18:39:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B5921809561;
	Mon, 29 Jun 2020 18:39:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T9xDvh019004 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 05:59:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1825E1007A20; Mon, 29 Jun 2020 09:59:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1284B10085E7
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:59:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 147F2185A797
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:59:11 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-344-H-QnD5hYM3qfO0qKa-orFQ-1; Mon, 29 Jun 2020 05:59:09 -0400
X-MC-Unique: H-QnD5hYM3qfO0qKa-orFQ-1
IronPort-SDR: TaWoHCCSw8Sj2dBnnq++sA+PiI3ES4zi6OvW3asKAnPDUx3YJWmSvQfn4GKWAdHoJ7nuo9r9r8
	VNwjExQlDN3yTO7OS1Y+yjctPkZiaWYKRmHFEHG/VHWFZ0aJawqMzGXKPG2UbT7TpaBTcF42GB
	EvUnG1jhr95HBPMopy/ZBAK4ZvqYuUolh7t5Ib9ugwwC7pElR5ZCrc531pMbZclCdIRnuTN/lu
	9NPSykRPrCCrLMSMKub1VRLtHngHtcyhmvV6tYis+UsYUU142GaLnLyH9uKbd8/12duEz+6WLz
	BFk=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="141385459"
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 17:59:07 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB5007.namprd04.prod.outlook.com
	(2603:10b6:805:9e::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20;
	Mon, 29 Jun 2020 09:59:06 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 09:59:06 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Tejun Heo
	<tj@kernel.org>
Thread-Topic: [PATCH 05/14] block: move bio_associate_blkg_from_page to
	mm/page_io.c
Thread-Index: AQHWTFVJvbniMUYqRE62LRQB5ELYuA==
Date: Mon, 29 Jun 2020 09:59:05 +0000
Message-ID: <SN4PR0401MB3598BAA43FFB5271003CA34B9B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<20200627073159.2447325-6-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c693e8a7-c875-4b21-e8ee-08d81c130f56
x-ms-traffictypediagnostic: SN6PR04MB5007:
x-microsoft-antispam-prvs: <SN6PR04MB5007E1F86191C4018568CA5B9B6E0@SN6PR04MB5007.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y4LlsQdkh11NzZg+J3vvFUPMSPkIBLi+c9zqIbZIErgDkTCYTG8EsJhDSzN0CTFmbqY5VBBJImlWfKQYM1UhNa/QWamtsr1jLkYkCThIhRUDe2iBEi19PDZ2E+xX/2H/+sanupPnzcIDZ7zyzC4Jp0/jF7RGSKfml3SFUA7kTtAMYE9Ip0HTY9ZvSiaCtCGDx/DPfpvMStAjcoc9UE6RGowlCBeUA5cfK/uvE9Au86vDgU/3KEzx7d0+2fK3avcQ4E532PkdgYARfomlG+cTl2yOk0B6j5H6yc4Vj4Pj5iinxl3/Qn5xSyDDVxvqea2sLtG1tz1MvPXrTu94gWvJQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(19618925003)(71200400001)(558084003)(33656002)(478600001)(316002)(9686003)(2906002)(52536014)(55016002)(6506007)(7696005)(91956017)(76116006)(8936002)(7416002)(4270600006)(5660300002)(8676002)(54906003)(86362001)(186003)(4326008)(66476007)(66556008)(64756008)(66946007)(66446008)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: HnlWYtELagfByzNfsz0LN6YKHn7C51txHWmMbC+as7COZ3Vw1r2Tc4zdenm9d8M3Adz0RxJEBl9TLh+30ye3gzY4PTAQKhM2ldxEbGGPnybhhXPzCmjXP8jKXnIJQyyAXAe9hhC7QEffl3eCmJNNDrQmiotIy+FtSJ0DHx20+utGJy0ZvOblZAd9TmNwo+JELUkxbfnZ2XV14mWiv9GKQGWtlVLev7m3319damrg1/HZCMCyJGB8QkI6Fk6hU8wmWE6cfpgbawcyLuOOnauRCL6KiNRC9oB4Dq/nn5l0vIMIGCMvq/MSBApKnMGCWWy9PHmFdEVwvHW0+3SgxSnkki40hofymO/AOf4objTE1eyov5sGUmUySPBLUFmC1wIbwxeRi6N1OXWnz23yl+S8AnoXhhpsnxWgsy3xc8TCL1UboGNtZ5QJCgBu8SHOy1fdPfJBGOdTlZlKWPOtiYglnW68bXtaR6kCV9pVS6A4aySeFxpSEj1D16Mzqnu9121CTEVvMPQlG3YA3tlggnCty8AZUw6DmzQAxSv/Bg26letxLDvAicxIDLQ6C9QERrvZ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c693e8a7-c875-4b21-e8ee-08d81c130f56
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 09:59:05.9026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnv610Sogw/DLPLaxW8X7JJLewBYVzqsAwEXvwyh4wd62a+ScOq0/FjeZ1MgzEfq+jMDfdmZVeXR7b3rRTFv8moYl9x6YxFKzob/7gQPaWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5007
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05T9xDvh019004
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Johannes, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Li Zefan <lizefan@huawei.com>, Weiner <hannes@cmpxchg.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] [PATCH 05/14] block: move
 bio_associate_blkg_from_page to mm/page_io.c
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

