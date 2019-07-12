Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B96631F
	for <lists+dm-devel@lfdr.de>; Fri, 12 Jul 2019 02:53:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7720B3081252;
	Fri, 12 Jul 2019 00:53:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B4045C207;
	Fri, 12 Jul 2019 00:53:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6B6F18184AC;
	Fri, 12 Jul 2019 00:53:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6C0rAah019381 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Jul 2019 20:53:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 677321001B33; Fri, 12 Jul 2019 00:53:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A21B1001B2B;
	Fri, 12 Jul 2019 00:53:05 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15717C049589;
	Fri, 12 Jul 2019 00:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1562892775; x=1594428775;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=vNeUAl7sNMj2d9vYIXTchLpR6N22JmonanZ+iSOedhs=;
	b=kxXNJiIGbKKA5QostkpARf+yBRSLDbwTVtSIn460GLSGIlNpoGbp6lVR
	JB72bRhBiinzDD3WHOEs5cdQ/zZU3Nub7tRjLV0vFvvWrnB0fPW42i2w7
	C7yJjWLVgJzrwWy1dNpFrlPo5GdOztgKgLFcKf4zJY0v6sZEIKagYti2F
	hs0AuVtOlYl803VtIzeZ/ckLhMdOyLxMTTGuWwVnEAaAeYUcLEswLHOIU
	z3rmt0z59GwdrXV4IFnU/YBvB6gPdsaiHEl/XsqQpPzpZCCdgNoP8qKaH
	xxsdQ/oRpS5eDMTL7KZedYaApOrQ+c1NdiY+caF3C2IGgMDkauW9+RZWT g==;
IronPort-SDR: 12atzZ1Pm52tkCdIU28oKZMuOsdIb/LBXMCGqTpVX5Mvj8VmHlAHklxX9Bt/D4mSeuo0I+lAgk
	4DbefdD1Lqp3J+K40lkHNC/nyQlQfaXNddx/suyHoCuAdq5uoyIyoKkOlWMnCds6/OcbEp+bqO
	WHnYhU8ZeUcml1fEM7UlN6KzYjv/jnifnPbUbK8CSD9BcUzXgQP07VLLwC2AT0JbwJk8JT1Z0I
	yIRs2lSTC4dCNTpLJCvjZ6yMS+qIYAYJBYzyO2DS0dQHw7mZCEra/KKITr8JVn03irG7yNfMvW
	Gcs=
X-IronPort-AV: E=Sophos;i="5.63,480,1557158400"; d="scan'208";a="219259508"
Received: from mail-bn3nam04lp2051.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.51])
	by ob1.hgst.iphmx.com with ESMTP; 12 Jul 2019 08:52:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vNeUAl7sNMj2d9vYIXTchLpR6N22JmonanZ+iSOedhs=;
	b=YkGeuHrB4wyV5L152Wy8lu14uPYwzlBz0OZXA/lMSJov3wWLiUxBIjQN5xDi/2iMP22ygxXq4SpD7Z5b4B7Um+D5KK8fbxKkHb32Ot40o+xdPKOQ7M68vdPqxmn+/LKv4qhWSZSyjMZIzsWNjhzIPc/Q8qVMVwcSBkI+zYBx3C8=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB4630.namprd04.prod.outlook.com (52.135.238.83) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.17; Fri, 12 Jul 2019 00:52:05 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2073.008;
	Fri, 12 Jul 2019 00:52:05 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Thread-Topic: [PATCH V6 3/4] sd_zbc: Fix report zones buffer allocation
Thread-Index: AQHVL8sveLyE842Ki02oZZ+qoDG8mg==
Date: Fri, 12 Jul 2019 00:52:05 +0000
Message-ID: <BYAPR04MB58168DD2A9F429D515E377A1E7F20@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
	<20190701050918.27511-4-damien.lemoal@wdc.com>
	<yq1wogo85c6.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23f6199b-c36b-4af5-a0dc-08d7066328b9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4630; 
x-ms-traffictypediagnostic: BYAPR04MB4630:
x-microsoft-antispam-prvs: <BYAPR04MB4630A65B44B9B6D9542D4E77E7F20@BYAPR04MB4630.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(189003)(199004)(9686003)(6436002)(7416002)(71200400001)(55016002)(66946007)(91956017)(2906002)(6116002)(64756008)(66476007)(76116006)(81156014)(6916009)(66446008)(8936002)(14444005)(33656002)(71190400001)(53936002)(8676002)(229853002)(86362001)(316002)(25786009)(256004)(446003)(52536014)(66556008)(68736007)(3846002)(26005)(478600001)(14454004)(53546011)(54906003)(7696005)(476003)(6506007)(74316002)(102836004)(186003)(305945005)(6246003)(76176011)(81166006)(66066001)(5660300002)(7736002)(99286004)(4326008)(486006)(3714002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4630;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ON4hoFoQyaNYDZARdyMnqFHp1OJh8lUr2ji2Mwdrzjw0Wo7u/0g/+5OAr/HHRIlumjHIXYyMNw3VOFfQBD3q9FOeL7gAxHipVcyumxdmuo7gP+N9cf8bcCxQ3+5Gi9MEh9N7XDdib6dZ+YuI6CO1D9xHdOgjoo15JTqXyLSCpWmiApf3812GtJuQamEXyZ7swd38ZTzMZQgGwcotk8b5VInMmJLEcir1WRq8rY+dRvdAR2VcHC6//+R7orMr5oaUH3kQ+PYbWJo49q5eRvKjN+3dkayC9n5/e/hbb2Rf6Lleck3pGW9k6uVKuJ7kanwzSHZNNXqC+wZC2BSt4NyPEyTgDOJQFemp8PHo5+mCmPr0Ftp4DYz8+2koCUPAc+g8shqjacfr/lt7ycHOEiu8DddO3WN6iXudYRJpVXGiBOQ=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f6199b-c36b-4af5-a0dc-08d7066328b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 00:52:05.0187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4630
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Fri, 12 Jul 2019 00:52:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Fri, 12 Jul 2019 00:52:55 +0000 (UTC) for IP:'68.232.141.245'
	DOMAIN:'esa1.hgst.iphmx.com' HELO:'esa1.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.141.245 esa1.hgst.iphmx.com
	68.232.141.245 esa1.hgst.iphmx.com
	<prvs=0899dbd4f=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6C0rAah019381
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH V6 3/4] sd_zbc: Fix report zones buffer
	allocation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 12 Jul 2019 00:53:26 +0000 (UTC)

Martin,

On 2019/07/12 9:28, Martin K. Petersen wrote:
> 
> Damien,
> 
>> During disk scan and revalidation done with sd_revalidate(), the zones
>> of a zoned disk are checked using the helper function
>> blk_revalidate_disk_zones() if a configuration change is detected
>> (change in the number of zones or zone size). The function
>> blk_revalidate_disk_zones() issues report_zones calls that are very
>> large, that is, to obtain zone information for all zones of the disk
>> with a single command. The size of the report zones command buffer
>> necessary for such large request generally is lower than the disk
>> max_hw_sectors and KMALLOC_MAX_SIZE (4MB) and succeeds on boot (no
>> memory fragmentation), but often fail at run time (e.g. hot-plug
>> event). This causes the disk revalidation to fail and the disk
>> capacity to be changed to 0.
> 
> Probably easiest to funnel this through block with the rest of the
> series.

Sounds good to me.

Jens,

Could you please consider this series for 5.3 ? We have been using it in tests
since 2-3 weeks ago (5.2-rc6) without any problems. All revalidation problems
disappeared and with no side effects detected.

Thank you.

> Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

Thanks !

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
