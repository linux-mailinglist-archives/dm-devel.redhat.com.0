Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA4C22AA14
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jul 2020 09:53:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-77X3rVi0MAOdwjj5zUkLSg-1; Thu, 23 Jul 2020 03:53:48 -0400
X-MC-Unique: 77X3rVi0MAOdwjj5zUkLSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 707781923774;
	Thu, 23 Jul 2020 07:53:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFC3061177;
	Thu, 23 Jul 2020 07:53:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41782730C4;
	Thu, 23 Jul 2020 07:53:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M7jYj4018415 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 03:45:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0518010145E2; Wed, 22 Jul 2020 07:45:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E20E51111431
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:45:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2C3080CC2D
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:45:31 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-467-lm0-qUDgMGqaaeBiFrrGoA-1; Wed, 22 Jul 2020 03:45:29 -0400
X-MC-Unique: lm0-qUDgMGqaaeBiFrrGoA-1
IronPort-SDR: SDjlXVEhUp0fAxb7HA0iZl2lppjVGzgppUkGG+WGLW49GubZShj2qUNUK5fNy4VXMQ7uM5NF6g
	MarhJ3NvqMvRPN/606pU/xuhmhczi+lE91rLKYEKA+oV6uoB5H0IdBUqdnKqU36BIXI5+/DVgT
	wgx9aceZ/vD9Eop0RBjUf+MudWDzMAGwbQcjD0PFQ5hzZ1q/QUjE19+Vql9NhvSaR8W98oqvMz
	qjibeh+XqSl2YoU50c12tPKRtuhHIbtFEukHVOoXJJV86GB5DD7DPM0Lpj5gzLvU6/YwO3x6Y6
	Q4U=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="144357296"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:45:27 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB5166.namprd04.prod.outlook.com
	(2603:10b6:805:94::10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17;
	Wed, 22 Jul 2020 07:45:25 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026;
	Wed, 22 Jul 2020 07:45:25 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 09/14] bdi: remove BDI_CAP_CGROUP_WRITEBACK
Thread-Index: AQHWX/E7tn9lZZ9OhUyy9G9ALxYa2w==
Date: Wed, 22 Jul 2020 07:45:24 +0000
Message-ID: <SN4PR0401MB35988BC2003CCDFC7CE8258F9B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-10-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c408b401-570b-44b8-cdf6-08d82e133232
x-ms-traffictypediagnostic: SN6PR04MB5166:
x-microsoft-antispam-prvs: <SN6PR04MB51661888992ABF6700F326FB9B790@SN6PR04MB5166.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EfDnxd+GPm0gZxTebfIFv6FzPlTSO1L25VMdJjFqeTLDSm95+2EeoCncor1Ikx12NOs4A+eQLtb91OotgtTkwkMqjEjcLDYer1UXXwFK88XlDNn1VcC789J1XI+YCfboC4NQONkv1aqjH2CGDULcJvndJokgksu+OyxWeUJ7sui9iztfLHfi4h58+IcNHU9petmCnmts7XzJ8feEu8J7MzCOPz/+O66g51FfXLHwDFfuo/FKIH9r0/+Cg4GR4g+BJTTeRFfkvlUyiQGc9z/ZjV+LrFhQKJD7JCd+oqdQXKCqCMn/aQUmhjRqjxZN7XcLPYMVWY6tgZGNDWXbz1Uqpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(9686003)(55016002)(86362001)(26005)(558084003)(7416002)(52536014)(5660300002)(83380400001)(186003)(76116006)(66946007)(66446008)(64756008)(66476007)(66556008)(8936002)(478600001)(54906003)(8676002)(7696005)(110136005)(316002)(2906002)(91956017)(4326008)(53546011)(6506007)(71200400001)(33656002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 4Vf7Bw2L2SMhl3Jt3ilKs7ZxghqXd79kKvSP0ct+ChAlqLmLNj25NXPhAalKXCu+YIG48i068OUEUN4KbDcYD0Hs/4j3WJUCFvzLlt53HJvY/ue9U+1J4qJGyiIFHnJbqZkwfh5gcTysF4pp0RekCJ9GpLa/gL7pxT5vh35fxY/ONSjnEm1YFiihH0NflWOi62TZ4iUOtvcqy8kPeRgvhsMxNHAD+c3NVTilVhm32WxzcUWmG8IEJS+97EFA3iCNiQr3EbnB8sozmmMHjVZH0QG7Vp1YT2z2PL0ZR9pM5MyFMTN/unviq9YFquqWSSmDfyEu+VQ8XJYnvqHzkqTkEZ1ZiQ0x9U2ydIA5/YGw/KT8m+pA2hWsxgBhkidG5ZrFUqkSkUSwJ5jhWEusaX4QaW+vL6YHK4QyZrHGmLc9W5hvA0iDXzx+//rVN6Q5xL0DCjkkAO59PGD5+es9JShbbi+JPLfiXOeIrnzflaWg4qgWIqs51Z6d8CAdXS8f0wwv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c408b401-570b-44b8-cdf6-08d82e133232
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:45:24.9244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SirNX0bUajLMGXRH0iKCjWPNXUs9Ukmcwo5ehc24DNrjMj6KWKusnbx4pI2xSrXuVT41q2axOQJFRyDnqTFudULMSRzXqqnqTrUhVIuh+2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5166
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06M7jYj4018415
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 23 Jul 2020 03:53:01 -0400
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, Richard,
	Minchan Kim <minchan@kernel.org>, Weinberger <richard@nod.at>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [dm-devel] [PATCH 09/14] bdi: remove BDI_CAP_CGROUP_WRITEBACK
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22/07/2020 08:27, Christoph Hellwig wrote:
> it is know to support cgroup writeback, or the bdi comes from the block
knwon  ~^

Apart from that,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

