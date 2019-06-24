Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3F5526D5
	for <lists+dm-devel@lfdr.de>; Tue, 25 Jun 2019 10:40:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6967830833C5;
	Tue, 25 Jun 2019 08:39:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 502485C232;
	Tue, 25 Jun 2019 08:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DAA3206D1;
	Tue, 25 Jun 2019 08:38:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5OMSfX4031390 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 18:28:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3DD760C43; Mon, 24 Jun 2019 22:28:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C77560BE2;
	Mon, 24 Jun 2019 22:28:37 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 780B6C058CBD;
	Mon, 24 Jun 2019 22:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561415304; x=1592951304;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=Ad2l5Rxs2ffri8g3/mqgPG6MkPo0WoV3ruZusr+gDMo=;
	b=PdrKr5gGQCcv+EeZBcBSX74OhAxr/8NUNbyOVW1rHOQvYZSUx9fCbwNm
	24grwU2nzHZSxwrPGpqlqoyWh/Eux77JIptCCEIKSqdx29JXL1NTrumhv
	TMPPIRXpFJTQO1gVRYKhG3vxtBd2t9Wosc11/xZuZUGq1DHVGoxLFSWj5
	DXsFh9HNatIbMvBdLrTr0am1Wtpdo1f9IGapWF5mxfhYvCOB5tzUKwnUu
	n/LFEHocwuB5NHezcV3CqVUe34cLQ8mM4n4BVzGiA04/72i2+cvcOwYPG
	qY17wW9jFH7e31QGiQw35tQpk3JznwDtMw2y21RXIGPUp5Q2rdZXwW2u1 Q==;
X-IronPort-AV: E=Sophos;i="5.63,413,1557158400"; d="scan'208";a="113058832"
Received: from mail-co1nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.57])
	by ob1.hgst.iphmx.com with ESMTP; 25 Jun 2019 06:27:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kqNwmNu5y/f2dDCnQjmEaTDgAzDeVr7iRYr3FaankfI=;
	b=fKHBfaJYGdwkzrI+S7TORyjZlHR+bWnvzSxZp0rS+eUWKvhOmiTqCqJZed0JQKtRV9ZR4v9JkCeJkZJ+FTn0yUYgtpqGKGfsbI9dOZJNf/LINcpTfTBcRpmLhypGwW2dEJzM1Hys21rIsd/+OwlY6tIxuMYqbYGQ3ovHyqXBE0E=
Received: from BYAPR04MB5749.namprd04.prod.outlook.com (20.179.58.26) by
	BYAPR04MB5510.namprd04.prod.outlook.com (20.178.232.28) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.17; Mon, 24 Jun 2019 22:27:55 +0000
Received: from BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::fc2b:fcd4:7782:53d6]) by
	BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::fc2b:fcd4:7782:53d6%7]) with mapi id 15.20.2008.014;
	Mon, 24 Jun 2019 22:27:55 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>, =?iso-8859-1?Q?Matias_Bj=F8rling?=
	<mb@lightnvm.io>, "axboe@fb.com" <axboe@fb.com>, "hch@lst.de" <hch@lst.de>,
	Damien Le Moal <Damien.LeMoal@wdc.com>, Dmitry Fomichev
	<Dmitry.Fomichev@wdc.com>, Ajay Joshi <Ajay.Joshi@wdc.com>, Aravind Ramesh
	<Aravind.Ramesh@wdc.com>, "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>, "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [PATCH 1/4] block: add zone open, close and finish support
Thread-Index: AQHVKDJQD2Z4QYw9b06emkXLk9EL8A==
Date: Mon, 24 Jun 2019 22:27:55 +0000
Message-ID: <BYAPR04MB5749CEFBB45EA34BD3345CD686E00@BYAPR04MB5749.namprd04.prod.outlook.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
	<ee5764fb-473a-f118-eaac-95478d885f6f@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Chaitanya.Kulkarni@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f19b20c5-2b5f-4ce0-1129-08d6f8f3345f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5510; 
x-ms-traffictypediagnostic: BYAPR04MB5510:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5510DDA3901AD74B1FC1B8E386E00@BYAPR04MB5510.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(366004)(136003)(346002)(376002)(396003)(189003)(199004)(71190400001)(76116006)(4326008)(52536014)(25786009)(2501003)(71200400001)(5660300002)(33656002)(66574012)(66946007)(73956011)(66446008)(64756008)(66556008)(66476007)(68736007)(54906003)(486006)(316002)(476003)(110136005)(446003)(14444005)(256004)(6116002)(3846002)(7416002)(66066001)(76176011)(72206003)(102836004)(53546011)(6506007)(99286004)(186003)(26005)(55016002)(7696005)(53936002)(6246003)(478600001)(6436002)(86362001)(8676002)(2906002)(2201001)(9686003)(14454004)(8936002)(229853002)(81156014)(7736002)(81166006)(305945005)(74316002)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5510;
	H:BYAPR04MB5749.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 201BaMtI03Vi7dtOD1ZJgoB3JwjF8mf77v7Gzcs1YS9HKG04swsK21mWQQX17bOXylHKuFhh9nnwUAT2F8QbSY+LBVS83zqmP0vhPAK2Zyp008GtlmZmJDKe2rR7apm43B1mwfLanffZWjqJdvLlbQFiIQ965Jh+AxCXWYHbc+UAmLt0mRUlxfAw2UsEyCY6YS6fYysEfcRdSn7w4GLIzs7jf1uTa8l22/cndNhJM49u7jH6/qF/sO8H2B006xClgj/XWxXrKnVMFVAwdOvSQJWWKW2M3uulY+CphqnlYHoloo3gbPEG+tK7cPC5FAEWjQ/IrzvOrqOeMeJXXLehR2Pw7+IEFmzEeNtB527qjjk8Oq4alkRaaLarDYsv/qcr3HTNOiKWGQ7KEsoA/945ajuZe7ROf/52BKx6GGm8W8o=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19b20c5-2b5f-4ce0-1129-08d6f8f3345f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 22:27:55.7511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chaitanya.Kulkarni@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5510
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Mon, 24 Jun 2019 22:28:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Mon, 24 Jun 2019 22:28:24 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'Chaitanya.Kulkarni@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com
	216.71.154.45 esa6.hgst.iphmx.com
	<prvs=07120bfb0=Chaitanya.Kulkarni@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5OMSfX4031390
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 25 Jun 2019 04:37:27 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 25 Jun 2019 08:40:06 +0000 (UTC)

On 6/24/19 12:43 PM, Bart Van Assche wrote:
> On 6/21/19 6:07 AM, Matias Bj=F8rling wrote:
>> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
>> index 95202f80676c..067ef9242275 100644
>> --- a/include/linux/blk_types.h
>> +++ b/include/linux/blk_types.h
>> @@ -284,13 +284,20 @@ enum req_opf {
>>    	REQ_OP_DISCARD		=3D 3,
>>    	/* securely erase sectors */
>>    	REQ_OP_SECURE_ERASE	=3D 5,
>> -	/* reset a zone write pointer */
>> -	REQ_OP_ZONE_RESET	=3D 6,
>>    	/* write the same sector many times */
>>    	REQ_OP_WRITE_SAME	=3D 7,
>>    	/* write the zero filled sector many times */
>>    	REQ_OP_WRITE_ZEROES	=3D 9,
>>    =

>> +	/* reset a zone write pointer */
>> +	REQ_OP_ZONE_RESET	=3D 16,
>> +	/* Open zone(s) */
>> +	REQ_OP_ZONE_OPEN	=3D 17,
>> +	/* Close zone(s) */
>> +	REQ_OP_ZONE_CLOSE	=3D 18,
>> +	/* Finish zone(s) */
>> +	REQ_OP_ZONE_FINISH	=3D 19,
>> +
>>    	/* SCSI passthrough using struct scsi_request */
>>    	REQ_OP_SCSI_IN		=3D 32,
>>    	REQ_OP_SCSI_OUT		=3D 33,
>> @@ -375,6 +382,22 @@ static inline void bio_set_op_attrs(struct bio *bio=
, unsigned op,
>>    	bio->bi_opf =3D op | op_flags;
>>    }
> =

> Are the new operation types ever passed to op_is_write()? The definition
> of that function is as follows:
> =

May be we should change numbering since blktrace also relies on the =

having on_is_write() without looking at the rq_ops().

197  * Data direction bit lookup
  198  */
  199 static const u32 ddir_act[2] =3D { BLK_TC_ACT(BLK_TC_READ),
  200                                  BLK_TC_ACT(BLK_TC_WRITE) };  <----
  201
  202 #define BLK_TC_RAHEAD           BLK_TC_AHEAD
  203 #define BLK_TC_PREFLUSH         BLK_TC_FLUSH
  204
  205 /* The ilog2() calls fall out because they're constant */
  206 #define MASK_TC_BIT(rw, __name) ((rw & REQ_ ## __name) << \
  207           (ilog2(BLK_TC_ ## __name) + BLK_TC_SHIFT - __REQ_ ## =

__name))
  208
  209 /*
  210  * The worker for the various blk_add_trace*() types. Fills out a
  211  * blk_io_trace structure and places it in a per-cpu subbuffer.
  212  */
  213 static void __blk_add_trace(struct blk_trace *bt, sector_t sector, =

int bytes,
  214                      int op, int op_flags, u32 what, int error, =

int pdu_len,
  215                      void *pdu_data, union kernfs_node_id *cgid)
  216 {
  217         struct task_struct *tsk =3D current;
  218         struct ring_buffer_event *event =3D NULL;
  219         struct ring_buffer *buffer =3D NULL;
  220         struct blk_io_trace *t;
  221         unsigned long flags =3D 0;
  222         unsigned long *sequence;
  223         pid_t pid;
  224         int cpu, pc =3D 0;
  225         bool blk_tracer =3D blk_tracer_enabled;
  226         ssize_t cgid_len =3D cgid ? sizeof(*cgid) : 0;
  227
  228         if (unlikely(bt->trace_state !=3D Blktrace_running && =

!blk_tracer))
  229                 return;
  230
  231         what |=3D ddir_act[op_is_write(op) ? WRITE : READ];  <--- =



> static inline bool op_is_write(unsigned int op)
> {
> 	return (op & 1);
> }
> =



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
