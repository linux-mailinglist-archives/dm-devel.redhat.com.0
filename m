Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1354F25A69A
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:25:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-NO0jkJZ7MgOp95NWDq8EjA-1; Wed, 02 Sep 2020 03:24:21 -0400
X-MC-Unique: NO0jkJZ7MgOp95NWDq8EjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB54801FDF;
	Wed,  2 Sep 2020 07:24:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE5D987A6C;
	Wed,  2 Sep 2020 07:24:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B38B79DA1;
	Wed,  2 Sep 2020 07:24:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827OBq9027906 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:24:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB3F72156A49; Wed,  2 Sep 2020 07:24:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A55A12156A3A
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98C6F18AE953
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:09 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-22-5wVyA9z9OVKX1nD327bQlQ-2; Wed, 02 Sep 2020 03:24:07 -0400
X-MC-Unique: 5wVyA9z9OVKX1nD327bQlQ-2
IronPort-SDR: +isrtv2hTX26JQ0q3/zFevj3cYgquTQKlbw7m7C8wcP5SYOIQNuX4/Mz6padfKYBNdckR5Wt+5
	JKXZNCAjKgw0avk/uXMUIvm3hRMLH9A9vCrnfBtAZqZlgyRmGtrXFDN9VEsl/8CAx03blSd5DE
	Imk30bgqXTQqU8DXs37HSswd3q7zmKxrVdKJCClVj/uscfoF4xi3lvY2oGK5UR+HPTZRkrTgX0
	Hg477CD03ZxVnCi55vM6tRlbCj7lXGcLG3srBPAI3fVxJ4jnEvUQEhoPOGtO92SR8igQsq1tg8
	14o=
X-IronPort-AV: E=Sophos;i="5.76,381,1592841600"; d="scan'208";a="255918310"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
	by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2020 15:23:48 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB3966.namprd04.prod.outlook.com
	(2603:10b6:805:48::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15;
	Wed, 2 Sep 2020 07:23:48 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738%7]) with mapi id 15.20.3326.023;
	Wed, 2 Sep 2020 07:23:48 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 6/9] nvme: opencode revalidate_disk in nvme_validate_ns
Thread-Index: AQHWgHjs6OAepj9H6kWBHRxoz7ysfg==
Date: Wed, 2 Sep 2020 07:23:47 +0000
Message-ID: <SN4PR0401MB3598F740D7978B51F648672E9B2F0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200901155748.2884-1-hch@lst.de>
	<20200901155748.2884-7-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1590:f101:bd07:d1f9:7e6b:2014]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5169cc8a-2f34-4ceb-3468-08d84f11223d
x-ms-traffictypediagnostic: SN6PR04MB3966:
x-microsoft-antispam-prvs: <SN6PR04MB3966D912E48E8002A21136649B2F0@SN6PR04MB3966.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XV8PsCfqAgtG6dH7Fd/cIFCOtQ0PRFerIErS5bJEczjQtN3AyUWCKF8fOLfQITrXb9yWGz9v4wTKhLr4LKdcUXOn5yoo9hWSDUtCGJiO9/aqWMGsvs61O1YsASMx01doJ/n+sdcOxy274lcLHgXH1oCAJ9CkqN3itVs1AdTxvmYss2tNjDnQNQ9VyhvO65h2uYn3WRn4qyHcMtT5TqMrF8vdfq75ny1RSRS/C+tmUjyZS88c/yg2kb515FdhB7BOn+M+Y4TpeVj3GWHCaKR23qNUO0kqMjrh9LXoIgcCGTJxyC/bowhBUFT84UbxeAgkFP94gPlo6nbdDpTuW9QDzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(55016002)(4270600006)(8676002)(110136005)(54906003)(86362001)(8936002)(186003)(478600001)(2906002)(6506007)(19618925003)(7696005)(52536014)(316002)(558084003)(71200400001)(33656002)(66476007)(7416002)(66946007)(5660300002)(76116006)(9686003)(4326008)(66446008)(91956017)(66556008)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: wigWMfyO6LvWMMXN3LRT+2lELfzQjDOj+l4CpCOMCAsiT38TcZpAYVbCWCOFT3tFDcWzVemU+84DadVpLJr1j7UZ0A2lFdU+bmRSL9un0LBoQDFFjYX25p5N60O+jsRNhPoiepDiwe6x8YaI/+R7fRfCZzJuGQ8pUABidg34Yk/6i+6jjIJrF06vlYlczv+mT2XrNsS7GhxUloYY4tp8EpLIvzy84YGpou3woUQj5ib4Dnq7MaugycvZy6U2rZvCIcNQAlhftoCnzCvFgdUZ1qi/081TdXJAHQn97OzQv8Rx5TrQFrEtyVW1mehbT7q+twZ6swvfNQJHr3/E9614EE0iSsD1FADwWkiviQ1pfUNGVB4qXkQ8nmcBsOnVsDBjUcLEQIunWByb78w/bdzrPsD3sGH54EkI0m1sp5RhxDgLCeAZgPiDXLZjf+6q//Sxv3Bhj0uVmmT70jnGyoWpSiCuN+quv/53iSPGFFYNmZl/5zxmhSdgcSSDyd6erzcODwloIykeogFQ6O49uCBzRbuDmSdRUDReaeVPlzp2Hlw/XP9oDV9pPx63i9bm/pHWmzxZJNFzyT8i14OY8FQ/GYas2GYRP5kjxrNj+pzrsbENt7UqAOhl4Q51vu2KNRq7x/HT/pyB9vY8es85WtMDavnUPqrYlJKjsJ5NG81UkeoHMFdDiTBVTZ8RAUWD3LXUiCJ58tCHcGdGLf4VAL7DuQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5169cc8a-2f34-4ceb-3468-08d84f11223d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 07:23:47.8810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Ml4u55+yQ2yWUP6xTN2NXFaDG+I8YEBdwduVuzYHskPzLNMDCTwSyKnWyj3CHk49Xbd9xGDmQRxZf2F6n6QOGurMl3KIjjwrt6Fj07jZYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3966
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0827OBq9027906
X-loop: dm-devel@redhat.com
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Josef Bacik <josef@toxicpanda.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH 6/9] nvme: opencode revalidate_disk in
	nvme_validate_ns
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

