Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C155D14
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jun 2019 02:49:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEEDE308FC4A;
	Wed, 26 Jun 2019 00:49:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 571635D9C5;
	Wed, 26 Jun 2019 00:49:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 409551806B18;
	Wed, 26 Jun 2019 00:49:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5Q0jI26011506 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 20:45:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7EB20608C1; Wed, 26 Jun 2019 00:45:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3A686085B;
	Wed, 26 Jun 2019 00:45:13 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 951D68666C;
	Wed, 26 Jun 2019 00:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561509904; x=1593045904;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=3mtjwFGMvMi3gjfXOptop0WzP9MdRFMpDO7yTqymLeQ=;
	b=l1A7WOjIQ+og/IbuCzjRcn1Dx96Wb2nPSHX3jo8aENBa9E1YpBLankk+
	wqmfmu7hcxW9ZOAFYU9IoBy9b23BvicUnvsGIWj13qAAID9Q943enWj4h
	XAk2ibEI8L/WHMKcpavw9DtKjzGBWQakBBDE5PwF/z12Y8Z4G5oHOjQE2
	I44X6bdQO5Yj4O7LPFAkImGQ4QBdGjZLjYWcFaYNsAlgcS+jWk9xRuwDj
	/sV/U2GcbiAYIicbd7rAS+/3kBcykSn64IZS68vXcB+r6ig3ypsH+GJZT
	m0JHKXDzobKTmtFWppMMmG+bU3f0LJKPi1bQdOXVovaV20+9aDcCoG6oz g==;
X-IronPort-AV: E=Sophos;i="5.63,417,1557158400"; d="scan'208";a="111534674"
Received: from mail-dm3nam03lp2059.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.59])
	by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2019 08:44:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=OFNC57xpoAo/y5YNnN9KiVrI/Vo9DKSj3ThklbUX9BE=;
	b=lnWJPtZBq2ogCRk/u1Cv9hENu4KKhFN5Vceok4Ia+WFPzIlRwIcWSsDS84vBmepEE3IIgULG/tR5k4vKL1X3aNKHRGojeJG8LsDDUOnsSDqX8Okzw7Duk1tdHv6Z8PzUWhDcG8Z/Pn4SI39ysv+vYqePyVujOFVT9Olbq0cuf0o=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5367.namprd04.prod.outlook.com (20.178.50.92) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.16; Wed, 26 Jun 2019 00:44:34 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6%7]) with mapi id 15.20.2008.017;
	Wed, 26 Jun 2019 00:44:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>, Bart Van Assche
	<bvanassche@acm.org>, =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@lightnvm.io>,
	"axboe@fb.com" <axboe@fb.com>, "hch@lst.de" <hch@lst.de>, Dmitry Fomichev
	<Dmitry.Fomichev@wdc.com>, Ajay Joshi <Ajay.Joshi@wdc.com>, Aravind Ramesh
	<Aravind.Ramesh@wdc.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [PATCH 1/4] block: add zone open, close and finish support
Thread-Index: AQHVKDJPztuCEJ+OF0q7RsgYaqLWMQ==
Date: Wed, 26 Jun 2019 00:44:34 +0000
Message-ID: <BYAPR04MB5816362745998E8A096F241EE7E20@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
	<ee5764fb-473a-f118-eaac-95478d885f6f@acm.org>
	<BYAPR04MB5749CEFBB45EA34BD3345CD686E00@BYAPR04MB5749.namprd04.prod.outlook.com>
	<cce08df0-0b4d-833d-64ce-f9b81f7ad7ca@lightnvm.io>
	<79ca395d-8019-9ec8-0c0b-194ca6d9eda0@acm.org>
	<BYAPR04MB5749977B2FFB5CDC8A254F5A86E30@BYAPR04MB5749.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4862b38b-6433-44fe-4b80-08d6f9cf75aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5367; 
x-ms-traffictypediagnostic: BYAPR04MB5367:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB53670B58122220FAC2D8C136E7E20@BYAPR04MB5367.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(189003)(199004)(316002)(8936002)(54906003)(8676002)(446003)(9686003)(102836004)(486006)(66574012)(476003)(55016002)(305945005)(66066001)(2906002)(68736007)(6116002)(2201001)(86362001)(478600001)(25786009)(71200400001)(71190400001)(3846002)(7416002)(33656002)(52536014)(6246003)(7736002)(256004)(53936002)(7696005)(6436002)(72206003)(14454004)(14444005)(26005)(229853002)(4326008)(99286004)(74316002)(76116006)(186003)(6506007)(73956011)(66946007)(91956017)(76176011)(66446008)(66476007)(53546011)(66556008)(64756008)(81166006)(110136005)(2501003)(81156014)(5660300002)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5367;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f32hnMtgNYo8yagYjtB3FxKOouKFmjBnxaN9nMrS7hpB+hwg4j2I8ShgcBcL0HkDtXsc2p6ls/TWA1t2G/YPh8q7GCEIu5SuBim1CO1LG05r1aFSL9nAT9/QZiZo7fef30YRS2temPAv36zrR9whtesxQjbUnWiN2kJt9W7/jhfWValZdRXohJUXc7781BFc2MwqxpyKWU3pnyA4oEbIB59pJN9pXj5kBFUGd7iOelHGTEid/lDgBOs01yCUMqy4ykAgpdIujjBEJqYccTL+9bY8M1g3iNl+cV1qZpmXwoTMz7YDBvL6dtmpx3I2QxAv2tq2sgBTxLaRyBn2oZiB1ebJPuG8mOwxXmBkk5K3HlTDFvBldSZwBQCootGIAa1T+/jyJSMQ4lJruAyRdE9ZDaQkvLVv7Y3v4rCT40cGDNM=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4862b38b-6433-44fe-4b80-08d6f9cf75aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 00:44:34.5915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5367
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Wed, 26 Jun 2019 00:45:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Wed, 26 Jun 2019 00:45:03 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com
	216.71.154.42 esa4.hgst.iphmx.com
	<prvs=0738cb6a3=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5Q0jI26011506
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 1/4] block: add zone open,
	close and finish support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 26 Jun 2019 00:49:28 +0000 (UTC)

On 2019/06/26 1:51, Chaitanya Kulkarni wrote:
> On 06/25/2019 08:56 AM, Bart Van Assche wrote:
>> On 6/25/19 3:35 AM, Matias Bj=F8rling wrote:
>>> On 6/25/19 12:27 AM, Chaitanya Kulkarni wrote:
>>>> On 6/24/19 12:43 PM, Bart Van Assche wrote:
>>>>> static inline bool op_is_write(unsigned int op)
>>>>> {
>>>>>      return (op & 1);
>>>>> }
>>>>>
>>>>
>>>
>>> The zone mgmt commands are neither write nor reads commands. I guess,
>>> one could characterize them as write commands, but they don't write any
>>> data, they update a state of a zone on a drive. One should keep it as
>>> is? and make sure the zone mgmt commands don't get categorized as either
>>> read/write.
>>
>> Since the open, close and finish operations support modifying zone data
>> I propose to characterize these as write commands. How about the
>> following additional changes:
>> - Make bio_check_ro() refuse open/close/flush/reset zone operations for
>                                           ^
> Since finish also listed above which supports modifying data do we need =

> to add finish here with flush in above line ?

There is no "zone flush" operation. I guess Bart made a typo here and meant
"finish". "flush" on a zoned disk is not different from regular disks.

> =

>> read-only partitions (see also commit a32e236eb93e ("Partially revert
>> "block: fail op_is_write() requests to read-only partitions"") # v4.18).
>> - In submit_bio(), change op_is_write(bio_op(bio)) ? "WRITE" : "READ"
>> into something that uses blk_op_str().
> Good idea, I've a patch for blk_op_str() and debugfs just waiting for =

> this to merge. Does it make sense to add that patch in this series ?
>> - Add open/close/flush zone support be added in blk_partition_remap().
> same here for finish ?
>>
>> Thanks,
>>
>> Bart.
>>
> =

> =



-- =

Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
