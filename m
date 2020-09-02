Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2E98125A699
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:25:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-p1XdtzJbMgS5_fp_sWJCMw-1; Wed, 02 Sep 2020 03:24:33 -0400
X-MC-Unique: p1XdtzJbMgS5_fp_sWJCMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A79741074646;
	Wed,  2 Sep 2020 07:24:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8157381186;
	Wed,  2 Sep 2020 07:24:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D72C79DAD;
	Wed,  2 Sep 2020 07:24:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827OO04027940 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:24:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3D5010F1BFE; Wed,  2 Sep 2020 07:24:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD58210F1BFF
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08BFF805B05
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:19 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-439-sugbpcZaO12mZA18a4jmjA-1; Wed, 02 Sep 2020 03:24:17 -0400
X-MC-Unique: sugbpcZaO12mZA18a4jmjA-1
IronPort-SDR: nafJtDwz7q/g5sTZdsH5gvMQLdGT8NIKlTetdPeBeZ1N03EBp0xaHz8Ok5UyH75odR0eDf4lUG
	x8FhbhH4cHNixu6uF1SvLQYX5jeaOd8CShf/x+Q6VcYHPPCURgYLFXdIAjQrXLRa3vi2NLRMSA
	4bm0fkYO0Pe/LW03AvKfzNcyPTKx3M2chqs+tJsrYM9tSyAW+w+7tWycSHR4xDiu1MjbgHhZ+O
	iJHGUweclU/XCC5LJRO6cbJNNV2Gfe1WuQIEo6/crjGxKYwsYE4y2UpAx2wlcjfODsYo4bQzTX
	b1k=
X-IronPort-AV: E=Sophos;i="5.76,381,1592841600"; d="scan'208";a="255918270"
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
	by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2020 15:23:12 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB3966.namprd04.prod.outlook.com
	(2603:10b6:805:48::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15;
	Wed, 2 Sep 2020 07:23:11 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738%7]) with mapi id 15.20.3326.023;
	Wed, 2 Sep 2020 07:23:11 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 3/9] block: rename bd_invalidated
Thread-Index: AQHWgHktLSbA5ZkuskSPO2+ZwjQCtA==
Date: Wed, 2 Sep 2020 07:23:11 +0000
Message-ID: <SN4PR0401MB35989D97E602B0000F82E67B9B2F0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200901155748.2884-1-hch@lst.de>
	<20200901155748.2884-4-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1590:f101:bd07:d1f9:7e6b:2014]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9365223b-b008-4771-c661-08d84f110c92
x-ms-traffictypediagnostic: SN6PR04MB3966:
x-microsoft-antispam-prvs: <SN6PR04MB39669B41CADD6B73F46EC00A9B2F0@SN6PR04MB3966.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: agD5XaPdbaQVSeSzu4fkHtkJ/VRxlRlDDVEGxBjMSnHFBbt45Ne34HMIrl05ycSYQnToBG6EOX6+/LL1fOYQgnchDJ4Tq6/+uW3RAlpG5+B1+AXnp0KITQ7D0BA8lOiLBpGHk69UrgcbjiXrU9PG3Vxejj+XvaJsSw/U1oaZxyBBHS3A4wpyOIpzdMUFS2uCJ5E06MoILEWMVw8ZYifRVoOl83xI6Wr8K4H/boDcwp7qYHHuQXnRUSvVA7Mmxpaq3IkXmRo74pKgDOylT44kWfSHG/pI8i6Lt/NTfTP7guD/FCzHu0+zy4MQdYy9lmW6XtNR2RSDweV23iMeV4RQ6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(55016002)(4270600006)(8676002)(110136005)(54906003)(86362001)(8936002)(186003)(478600001)(2906002)(6506007)(19618925003)(7696005)(52536014)(316002)(558084003)(71200400001)(33656002)(66476007)(7416002)(66946007)(5660300002)(76116006)(9686003)(4326008)(66446008)(91956017)(66556008)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: zita5OxGoQ33fEn/ZlvilfIj5xAq8Hg/xjtEa2FBpPWpNe9VSirjvP0QFnjlvzcyMRUXWdfcwk8DE090n8DjHn7q+r8IdKCuxLYhIyUjL2oYJOhyPSv8Z0r1IMOI/XI8g59XChk3O6m6KYg0hm5MjOG2XDU3ltnMaJKuCJWADQCMu69OdGfjX9ORfqePqbFpuEfoYU+aVDS372c0R7ELYyEXEIjN6Qw7kxiYS4T7b26Uh/jK2e30LXJV5hHs/e5Bon6ATRxVRbgYLYyms6p0Mexzk2Nw28Tnvtz/JwK7rI1bQGEY6YWEb+9itcpV7osk9JIPveSTNpYqZzRK+iCNUVHTmv4a+npzKexjYj+2lkA+2hLCivZEk/yuwLYwRpnOI27OSFsVAHTvLDTSVzOq28bxvqxxv4d6QBZnnWnMfcmT1GE7QUE13cfioZeGCBEKaBfadW0/ZaAWlqwAlGkSc7JuMXWLedGYsU/BKsrZ0H6ooQAtk/Fxk9xf0wZV3wFJ6pSLk/GbIJFrGJeZ6Xs7AHhQDw3Ab8mTLBa44AIT2s+QrghM+E2OAtgwiV9zV/jGIGc4TrvFHJ5hXb0HyZ5YGpcHex5OnQYvaQh0RbUDI+4itd0z4a+EH8XJOGSVdKPp8x9ohwl+8az9gGKbo7CsKp3CB7Jdm5w0PIhcslAAEHHbTb7lgmjXEzq26eFvrwPMMF+kJfN9b5mfbiWvNSeZLQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9365223b-b008-4771-c661-08d84f110c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 07:23:11.6049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRMKQuBx0pDuAjD3/npBNx4zS2+H5kQI9gL066NCl4nkEDvvyLgOnA1AZIqfPyK8Os7gPBRhlGLZbL1fr7VBwZAsB2+7sbTG0rmDEGdty9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3966
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0827OO04027940
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
Subject: Re: [dm-devel] [PATCH 3/9] block: rename bd_invalidated
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

