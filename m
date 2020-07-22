Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7434F229254
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 09:39:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-Az7M4eT6NBab57IkUQP5fA-1; Wed, 22 Jul 2020 03:39:46 -0400
X-MC-Unique: Az7M4eT6NBab57IkUQP5fA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE7759;
	Wed, 22 Jul 2020 07:39:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79F1878540;
	Wed, 22 Jul 2020 07:39:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D9461809563;
	Wed, 22 Jul 2020 07:39:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M7F40o014569 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 03:15:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44E92F884C; Wed, 22 Jul 2020 07:15:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FC831C664
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:15:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93AAA800658
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:15:01 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-66-7pxQfCVZPtSTK4nf8JVt7A-1; Wed, 22 Jul 2020 03:14:59 -0400
X-MC-Unique: 7pxQfCVZPtSTK4nf8JVt7A-1
IronPort-SDR: pc2/WjcuxvrFclU6NValPJXDB0tgAaoRuqe2a+akGKibVY8bjGEfmNLWnxt5SVoaTy2WAZDcbA
	Zh2ZnrZKvLbKxy2dQ7Ya99pwdBOjYQHa+9HMDxcv8AbJ1+50jFP9+F7ysipB0/fmlU4DJ9lRtp
	bqfPkL6x6T5nWhiw6z8PjhbdAffuA/MHghrwQXEm+y6lWNeOP2ilpzbePVaAoP9uHL6NmLXpkK
	gdtXW4UVq681ekeMP9Kx7xwrfPikLhKD92uMaTYHtygdGT8xaS9buJ+cdE36VFPeRhTDZ8QKo0
	hhI=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="143183408"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:14:57 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
	(2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24;
	Wed, 22 Jul 2020 07:14:56 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026;
	Wed, 22 Jul 2020 07:14:56 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 02/14] drbd: remove dead code in device_to_statistics
Thread-Index: AQHWX/FEcddsN2HZWUefz5cntVZ8LA==
Date: Wed, 22 Jul 2020 07:14:55 +0000
Message-ID: <SN4PR0401MB3598CBAC629556AA70E000CF9B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-3-hch@lst.de>
	<SN4PR0401MB3598495DA5AF46CAF019BDC69B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
	<20200722070703.GA25590@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2330670a-c853-4a70-2c1f-08d82e0eefd1
x-ms-traffictypediagnostic: SN6PR04MB4862:
x-microsoft-antispam-prvs: <SN6PR04MB48621C8B02F4B850406FCB339B790@SN6PR04MB4862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pl5JYcJ56Wm2GMn+ffg1yHsy/s18KiEfnhdruTshRVNiwwg68IxDuiZV2Xg85sAfinfSW2+6PJC/qt41JtX0B0MTRa+h6YEQHJRISjc7LZ/+H9RBUt2d6tUqVTnt7GkU38pmptlA35TSrZOBsh38/RAcWgcC4bZQ0igoqrX/GuKgJz9eexHX+2WFpOBeFO5hd5npmsOMRGgouluo1Q3YL16sZBAvs5tXKoUIYEeSd+nph4DjaimjKCQg5g7HQuJnesW1Xm3VLr+GOINK0obhrY44uCKKBOu1xeD9AK5SGuMR3kfHaJIrUMGaUwRA16JXLytT22rIRdU+mIIHx47uEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(5660300002)(86362001)(54906003)(6916009)(55016002)(316002)(52536014)(7416002)(8936002)(76116006)(91956017)(66476007)(6506007)(66556008)(8676002)(33656002)(64756008)(66446008)(558084003)(71200400001)(53546011)(478600001)(26005)(7696005)(66946007)(4326008)(186003)(2906002)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: HbBu7kpOiyx58MreNuqYGSs2WVDhCUOo5SGzo1ZwtaBXoDfkWv3trHEuQKK3mi1fcthYbNcAcWgfsMV1KMw3jQ2dm4EXbz/hUiYu/GOParcJf9cWiKb0rK4FFJ79CC6/6K3NPxCkr6aBqkav83mNQWFBPkDyaGb8xcUi1imTIzTkEefMO8sAmGX9Qst1ZwQeDron5FI1eWplmASeDD9u3G56RlcVJ9Pil6KMyGY4rYBvcC5pW0zjZwxfYmqM3Fxrxi3x6ftbTXFU5eQo4nCd3eAhXf/qp7WgMXYOxaqTkpsY3FM6hvNFA2mUUrK027X7/ntGunnWq8hE63cKGob3G5yGRW77mTQd3zc8UHVg3MjeVdIaNpd41IlYn/a/sRnQeH7zJwU4AvFuQ6634FO3v1pMMbQ8Iyvo7ayUidy1U8op9JtKnBIDRt26qWg7iLumeAc5ivsBsbFL9SAdCCn2ZmZ0fZps0YLLPB0kFO1VUIfxLkYwZIApnrJoM+ldYufX
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2330670a-c853-4a70-2c1f-08d82e0eefd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:14:56.0008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZP9tVVSQvpKEEiq4mwZWTQ/AfOFicHsKPAtUdZt1XAzhvm9CZ7ZqCQ7JH9RJZOv4MtTHxsV6Pk0j5r+2QDbgxeBB6q5QrZl/cYw5OoIsdGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4862
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06M7F40o014569
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Jul 2020 03:31:58 -0400
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [dm-devel] [PATCH 02/14] drbd: remove dead code in
	device_to_statistics
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

On 22/07/2020 09:07, Christoph Hellwig wrote:
> As far as I can tell this is a netlink user ABI.
> 

I guess it has to stay then



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

