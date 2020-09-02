Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B35D925A696
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:25:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-iLNxaafBNpeec7Cy6YWtgA-1; Wed, 02 Sep 2020 03:24:47 -0400
X-MC-Unique: iLNxaafBNpeec7Cy6YWtgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2370E1005E6D;
	Wed,  2 Sep 2020 07:24:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2E6C1045EB0;
	Wed,  2 Sep 2020 07:24:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7F2E180B657;
	Wed,  2 Sep 2020 07:24:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827ObZo027978 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:24:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F8B12156A38; Wed,  2 Sep 2020 07:24:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29CB92156A36
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10155101A53F
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:24:37 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-270-TCawaOpPNIOHWHRJkR56hQ-1; Wed, 02 Sep 2020 03:24:35 -0400
X-MC-Unique: TCawaOpPNIOHWHRJkR56hQ-1
IronPort-SDR: e+2NK0Rm0H8+t7/xXqCbp5NIzKL7O1JPSAZ+enQuzI638BywQZI80hoAZ37K8Jgai+smuvel3+
	YC6Y10oS3T8y4O5HylgnrSXPHMpL5+k4hZrWa7NBgW99lMBZJW3gkIbB0zDZMVY3/sN0+0fLYF
	mSMT0CX5c2gc45MtBkOaFzt2B89kdet5mrVSr8/oV47Or52EAu1q30qEDHam0adgIPFGvxwzyY
	314f2pKMiljuQdiComLJqG7D8THr+VbWjHfDR1hLn4LjwLNK9kXY6heVb+TF263V/Y9iCN4IHH
	qpo=
X-IronPort-AV: E=Sophos;i="5.76,381,1592841600"; d="scan'208";a="150728245"
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
	by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2020 15:24:33 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4238.namprd04.prod.outlook.com
	(2603:10b6:805:2c::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19;
	Wed, 2 Sep 2020 07:24:30 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::457e:5fe9:2ae3:e738%7]) with mapi id 15.20.3326.023;
	Wed, 2 Sep 2020 07:24:30 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 7/9] sd: open code revalidate_disk
Thread-Index: AQHWgHi9+D0vRxf7MUaqbL81EAOZ+A==
Date: Wed, 2 Sep 2020 07:24:30 +0000
Message-ID: <SN4PR0401MB3598270C537F0E7A3ED538049B2F0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200901155748.2884-1-hch@lst.de>
	<20200901155748.2884-8-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1590:f101:bd07:d1f9:7e6b:2014]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f12e4383-fcd1-41a8-ec18-08d84f113b95
x-ms-traffictypediagnostic: SN6PR04MB4238:
x-microsoft-antispam-prvs: <SN6PR04MB4238C6E35A3E8051FB5A3C5A9B2F0@SN6PR04MB4238.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bMjGwrvH49VG+SFumlAzF3c4O31aq6r0kIkCIOkw6SFfhFSnzrDt01M2WOR+Ek/f1JURBf5dlcJBqUxLuovzqS3Uc+BonFqSC094i2UpFonDCFaWi+TvgIqvc8VpM5wrtra5xWM1vzdGMkFLcPpzHCfkKK0BlyWblj4peSxPyVMc7gZtv3r+jum4RM5z4pIr95h1zNGlACxlZ5AG67OyGNbd4ADWi+vefuqz0qnVCKGk/grP4GvcdJ5fHVoRjDo3EIlOEBIIJG1JJinxgalfMzHs55RsYenkduPUoAVhBps5YE456bMOzcoH2uyLYnv8WkZJoo8p15iFkLWBufd0lQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(7416002)(2906002)(19618925003)(76116006)(8936002)(5660300002)(558084003)(66946007)(33656002)(91956017)(86362001)(66556008)(7696005)(64756008)(66446008)(66476007)(316002)(52536014)(8676002)(9686003)(71200400001)(186003)(6506007)(54906003)(478600001)(4270600006)(4326008)(55016002)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: ngkVHmW3/Bt+G5u+vylrG+VmQWBrwJdyMKVQ6lc7NsWLaz34Wky7qCz4D+3YBInqlWVwEtDiPb3fLXIwkFzvrPAa9j+N5y1BrwHvK5XeCSzCi0KeaaIOcIu5fbWTvPLfN/eHsaw7soQCL2pxUA/+YmuKFgbiT671ff+2SlQptf7Sa2/PschaqWGElfPuCYYz9iucV1V6ZiM6IEYAUU4fdjQnldVWApVOyoSQORvnAXdXS7mm48wFeBSR+w2qPZAnZ2OtZVBtFCGP82AySy06LCtAXSrdP18fiTq7UKG5ZWfj7tA5snniLmp/GKlvkn7GJGgSp6gFmna5clwcbRXAvO2RQdFHZhAdhkU3KseXOW6PKXl4zCMpO3QGTb64BD6kidLAWkWdX5VRAJYidQGqI1btlc8aiR6aeKh+DLHlEjPd8ekISZe1FySLjN025nhVn+v+NkR61SyDx4k7utXDrMlugXPpGPNavOomIX+noV8/mJw0f1DhkW2jpnd2fCBflToEO6PrRWTEstzYoqrGOxPOo109IeSopbemWPZ0AhuDrNLzzUzFRcoAy4cInX8JDP8VolFu1gHdRu78grWtjqoqDGMP42F7aSvE+8f6HRyoJw/cWSTBckfWokesve6Jshvi3Lt52g4KCAwwI8p3AoO58aHzH7Xo/rjjwAGGfIx21owcdNyx2LW94gEZCbPz97U5gbswioOcZ7G4BhrtlQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12e4383-fcd1-41a8-ec18-08d84f113b95
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 07:24:30.4715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hod2R3pvj6h3UjZbl9iEN/uDfqHDePJ6WU4fywwecOvUVJ9vFBEPV7QuGvYcjiZFqcxIf3o1RrzCzjPbkOVIU+3/vIZ9wRscUvOVOwlMoRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4238
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0827ObZo027978
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
Subject: Re: [dm-devel] [PATCH 7/9] sd: open code revalidate_disk
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

