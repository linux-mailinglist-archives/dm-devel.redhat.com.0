Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A255D08
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jun 2019 02:44:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B680B8665A;
	Wed, 26 Jun 2019 00:43:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84EB65D9C6;
	Wed, 26 Jun 2019 00:43:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 536B93D87;
	Wed, 26 Jun 2019 00:43:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5Q0hQOv008914 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 20:43:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2949E60C4E; Wed, 26 Jun 2019 00:43:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E779060BE5;
	Wed, 26 Jun 2019 00:43:21 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D69CC3082128;
	Wed, 26 Jun 2019 00:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561509794; x=1593045794;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=TerptpOsnKzNbiPdKKm/mSwBbelgQmCue9kffTcmSZ0=;
	b=bEewdPxM/w665UaJpHxTQJ9PsW1lvHT+H6gq95CheDjez1yPnselb+nH
	dWuLTi+dd1UJnngCTJBUDQRRf3DHrwBIHLHMnDlpFNLeVjDaE0h/T10Z0
	H2Uy6qY+q6bR9GolxHRUdCUmCAB0e3bMq0u7CNzkXWPwanhB2FbEf4dFa
	cqygqR1xRb/ytO/rYY+SF7lUsIgpvFfICm/Ji7JwndV8OcouJKZy6fHfK
	gmR43WFdilFZxFnHAGQhFByLYxbuLMgLoJEZ15Hx7dVUkgkXRak8YefKK
	G7ezdtDhRuSIEQQvbd2ihEVEBoXWA+kZTrVmiHqrevuNSQBA37MW3P6nL g==;
X-IronPort-AV: E=Sophos;i="5.63,417,1557158400"; d="scan'208";a="111534523"
Received: from mail-dm3nam03lp2052.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.52])
	by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2019 08:42:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TerptpOsnKzNbiPdKKm/mSwBbelgQmCue9kffTcmSZ0=;
	b=ThPin5BAblTxqTWIgfdnmnYEnSwOLE8CtN7YAH+kaercuiyd2CW14p91PIf4lM++PFHmm4ug4wOwnl5UhqjO2yQ20TfiKjJ9Dm/Ty6trEntuCwVbN6oddQmYEFsKVKvvoq/oyxtk8wiuDzBVD36jYgyBVEGhXuPKyvgl/alUg74=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5367.namprd04.prod.outlook.com (20.178.50.92) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.16; Wed, 26 Jun 2019 00:42:40 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6%7]) with mapi id 15.20.2008.017;
	Wed, 26 Jun 2019 00:42:40 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>, =?iso-8859-1?Q?Matias_Bj=F8rling?=
	<mb@lightnvm.io>, Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	"axboe@fb.com" <axboe@fb.com>, "hch@lst.de" <hch@lst.de>, Dmitry Fomichev
	<Dmitry.Fomichev@wdc.com>, Ajay Joshi <Ajay.Joshi@wdc.com>, Aravind Ramesh
	<Aravind.Ramesh@wdc.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [PATCH 1/4] block: add zone open, close and finish support
Thread-Index: AQHVKDJPztuCEJ+OF0q7RsgYaqLWMQ==
Date: Wed, 26 Jun 2019 00:42:40 +0000
Message-ID: <BYAPR04MB5816BCFFAF9648A7A55B144AE7E20@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
	<ee5764fb-473a-f118-eaac-95478d885f6f@acm.org>
	<BYAPR04MB5749CEFBB45EA34BD3345CD686E00@BYAPR04MB5749.namprd04.prod.outlook.com>
	<cce08df0-0b4d-833d-64ce-f9b81f7ad7ca@lightnvm.io>
	<79ca395d-8019-9ec8-0c0b-194ca6d9eda0@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c13c9e4f-5522-4ce3-d180-08d6f9cf31bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5367; 
x-ms-traffictypediagnostic: BYAPR04MB5367:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5367BCE9913C94A69E6DFD45E7E20@BYAPR04MB5367.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(136003)(376002)(346002)(39860400002)(199004)(189003)(26005)(14444005)(4326008)(229853002)(6246003)(7736002)(33656002)(52536014)(72206003)(14454004)(256004)(6436002)(7696005)(53936002)(81156014)(2501003)(110136005)(81166006)(5660300002)(53546011)(66476007)(66446008)(64756008)(66556008)(76116006)(99286004)(74316002)(66946007)(73956011)(76176011)(91956017)(6506007)(186003)(478600001)(486006)(102836004)(66574012)(66066001)(305945005)(2906002)(476003)(55016002)(54906003)(8936002)(8676002)(316002)(9686003)(446003)(3846002)(71190400001)(71200400001)(7416002)(6116002)(2201001)(86362001)(68736007)(25786009)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5367;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lRHTQDJ7Uk4HSzjOGfd8y6+C4tQy3ZjmtLrF3gWLqZUTEH2tDqOuy7rq8YlkbKgzwEDt8SzowetPm9Cmq92D94RufEZbLAhVD4TbxaNHyEinDrGvsfBRG/NELmkbO4cnyb5/ceslXdBdXKVOwH1T9V9pwhapE7lPR9G/fNE3a/xVMssex7b2p9es2u5pA2xB5NkP7g/n2G5fQ9CZAu/o93kFk0gcFg4pPhSlgpTMKlZd3in2MYgyYmiIvORus+r0gqkklw2C4ff/5vh3I0Fk7Zj0K2L+JVda1tTLCPy2O3eVUUHV2VPcUlZaYfWWTxknsrRFqu6B666JaKLFzuMyKF8OCN99uvMex62qguU/mzb2gVbqpVn0IvZwpPMiSCDaygdbzloS4KyMW0ipvtnzSh3ZVNzdBm1vZN/0KKviX6A=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13c9e4f-5522-4ce3-d180-08d6f9cf31bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 00:42:40.4874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5367
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Wed, 26 Jun 2019 00:43:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 26 Jun 2019 00:43:13 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com
	216.71.154.42 esa4.hgst.iphmx.com
	<prvs=0738cb6a3=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5Q0hQOv008914
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 26 Jun 2019 00:43:58 +0000 (UTC)

On 2019/06/26 0:56, Bart Van Assche wrote:
> On 6/25/19 3:35 AM, Matias Bj=F8rling wrote:
>> On 6/25/19 12:27 AM, Chaitanya Kulkarni wrote:
>>> On 6/24/19 12:43 PM, Bart Van Assche wrote:
>>>> static inline bool op_is_write(unsigned int op)
>>>> {
>>>> =A0=A0=A0=A0return (op & 1);
>>>> }
>>>>
>>>
>>
>> The zone mgmt commands are neither write nor reads commands. I guess, =

>> one could characterize them as write commands, but they don't write any =

>> data, they update a state of a zone on a drive. One should keep it as =

>> is? and make sure the zone mgmt commands don't get categorized as either =

>> read/write.
> =

> Since the open, close and finish operations support modifying zone data =

> I propose to characterize these as write commands. How about the =

> following additional changes:
> - Make bio_check_ro() refuse open/close/flush/reset zone operations for =

> read-only partitions (see also commit a32e236eb93e ("Partially revert =

> "block: fail op_is_write() requests to read-only partitions"") # v4.18).
> - In submit_bio(), change op_is_write(bio_op(bio)) ? "WRITE" : "READ" =

> into something that uses blk_op_str().
> - Add open/close/flush zone support be added in blk_partition_remap().

Sounds good to me. And indeed, all operations should be failed for RO
devices/partitions. Of note though is that only reset and finish operations=
 have
an effect on the zone data. Open and close have no effect at all on the zone
data and only change the zone condition/state. But since they do change
something on the drive, we can still consider them as "write" operations.

Best regards.

-- =

Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
