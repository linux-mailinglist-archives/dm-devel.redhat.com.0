Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 26972E42D5
	for <lists+dm-devel@lfdr.de>; Fri, 25 Oct 2019 07:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571980583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=n/tMEGnPfhKfkdYqR2kOlahKz3d+hr83UWbCcTxgttw=;
	b=YPIuFAuJFptBIMFaxsup1j5snNM1KbPbkk3V/JBEF+OjvwC072x3+ybmTKF6QRcgJUZE9x
	9eDns07hzU/9c/Ac29yNO/LXRmlDL7Z9F7fHI/CmjEBGqptiz90AYl1RtfRCt95Q/OarTf
	YzpTVfNBkEA7VfoHjPBrPe283e1QLP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-EridC7g4MJin00_vKW-8wA-1; Fri, 25 Oct 2019 01:16:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B042801E5C;
	Fri, 25 Oct 2019 05:16:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25CD65D712;
	Fri, 25 Oct 2019 05:16:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CF8D1800B74;
	Fri, 25 Oct 2019 05:16:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9P5Fn4Z009452 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 01:15:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F6E660600; Fri, 25 Oct 2019 05:15:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1807060852;
	Fri, 25 Oct 2019 05:15:44 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0C8D85A03;
	Fri, 25 Oct 2019 05:15:22 +0000 (UTC)
IronPort-SDR: uSIlbJyyq31tpf7gWq1fh5AqLhRVVGKaZMjBCMeKzA0GkzXPr0fbPAQwg4e4CgjvhewbxpeFzS
	OM8BP19rWH7BIQjztjhii9Gi70/QMBfAQ/EM8olFooM8YNto+kCvj923GwpNA8QRGQ4cGxzJHo
	Ed2F2XK7K0bM6HWNSkmZS3I7ek5AhHrFF/rtRwHTHMiE7H/cpcDxWe3Cu8oz000C866RPS+aGl
	Bz/YafmazDe0c2fvT71vs9puUoo4QwwD4/1+/6o+s0wq9tORP+m50Rk3Vx5FTjT27Hbgb0KJLi
	Cq4=
X-IronPort-AV: E=Sophos;i="5.68,227,1569254400"; d="scan'208";a="122084298"
Received: from mail-by2nam01lp2051.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.51])
	by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2019 13:15:08 +0800
Received: from BN8PR04MB5812.namprd04.prod.outlook.com (20.179.75.75) by
	BN8PR04MB6052.namprd04.prod.outlook.com (20.178.216.83) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2367.24; Fri, 25 Oct 2019 05:15:06 +0000
Received: from BN8PR04MB5812.namprd04.prod.outlook.com
	([fe80::8019:7d47:2cdd:5e4]) by BN8PR04MB5812.namprd04.prod.outlook.com
	([fe80::8019:7d47:2cdd:5e4%7]) with mapi id 15.20.2387.023;
	Fri, 25 Oct 2019 05:15:06 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Christoph Hellwig <hch@infradead.org>
Thread-Topic: [PATCH 1/4] block: Enhance blk_revalidate_disk_zones()
Thread-Index: AQHVijdM1MlBKY8uekurCnThmLcbow==
Date: Fri, 25 Oct 2019 05:15:06 +0000
Message-ID: <BN8PR04MB58124835167609CED0AD69FAE7650@BN8PR04MB5812.namprd04.prod.outlook.com>
References: <20191024065006.8684-1-damien.lemoal@wdc.com>
	<20191024065006.8684-2-damien.lemoal@wdc.com>
	<20191024070838.GA19572@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 162ac725-f5c8-43c5-2fa4-08d7590a4c8c
x-ms-traffictypediagnostic: BN8PR04MB6052:
x-microsoft-antispam-prvs: <BN8PR04MB6052A44E45F549DD0F19FCE8E7650@BN8PR04MB6052.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(199004)(189003)(74316002)(7736002)(305945005)(81156014)(14454004)(229853002)(66556008)(9686003)(6436002)(14444005)(66946007)(81166006)(64756008)(8936002)(91956017)(66446008)(6246003)(4326008)(53546011)(7696005)(76176011)(99286004)(102836004)(25786009)(478600001)(6506007)(76116006)(186003)(316002)(26005)(71200400001)(86362001)(446003)(71190400001)(256004)(3846002)(476003)(6116002)(52536014)(5660300002)(55016002)(2906002)(6916009)(66066001)(33656002)(54906003)(66476007)(486006)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR04MB6052;
	H:BN8PR04MB5812.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dRTat0/fXg807r+FqIIvCo+YaojhYmjTWhSMU60eZ8FM93RxhAkz4vkRy9lz/+OTwH3lwUzD8NvtUoPedLYrWqdMnzpejO8khPRNrnDnHB4HP+2A7VMYDAS6f4s543xQmm2Q2Bqch7hPtHOk7uH1igMTflDjZMyvsTB7twZH4Y+kgpBFCr3G4dOeJn2Jy2ZRJwsQT2O+nUJNNbMZGdKTpdczL+RZUeduFX61mX2xq7iod8IV7Ip8r1OgBhscc13aXGRdcbPxw7vzRZ+t77tUC2ZnpRIO8joD3xEe+OUSSS9zEfPKf0TUSycnq+ebDLDKsd1/6joFiwQXDb0xEDv+Ed8IzxVOP+MkB2yxprRFD0IvmwlOOQnrVwhPuXrJEsUEW9kFY+wQr13mRzUGPsMmzfbjSsn3Q9GGzbbVgbchllwVmNnCELN+x9GBKGHXtv2P
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 162ac725-f5c8-43c5-2fa4-08d7590a4c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 05:15:06.3126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAbDL/jDSKYwKQMFa2dTZNi18tx7lTPDABj6KUuyMJm8GE5xJqdGF8TCF0TONfEHhZ3FM2NHJ7gl/QhAWQ6xgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB6052
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Fri, 25 Oct 2019 05:15:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Fri, 25 Oct 2019 05:15:35 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com
	216.71.153.144 esa5.hgst.iphmx.com
	<prvs=1941ba3a1=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9P5Fn4Z009452
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH 1/4] block: Enhance
	blk_revalidate_disk_zones()
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
X-MC-Unique: EridC7g4MJin00_vKW-8wA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2019/10/24 16:08, Christoph Hellwig wrote:
>> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
>> index 4bc5f260248a..293891b7068a 100644
>> --- a/block/blk-zoned.c
>> +++ b/block/blk-zoned.c
>> @@ -441,6 +441,57 @@ void blk_queue_free_zone_bitmaps(struct request_queue *q)
>>  	q->seq_zones_wlock = NULL;
>>  }
>>  
>> +/**
>> + * blk_check_zone - Check a zone information
>> + * @q:		request queue
>> + * @zone:	the zone to  check
>> + * @sector:	start sector of the zone
>> + *
>> + * Helper function to check zones of a zoned block device. Returns true if the
>> + * zone is correct and false if a problem is detected.
>> + */
>> +static bool blk_check_zone(struct gendisk *disk, struct blk_zone *zone,
>> +			   sector_t *sector)
> 
> Maybe call this blk_zone_valid?  Also in many places we don't really
> do the verbose kerneldoc comments with the duplicated parameter names
> for local functions, as the scripts only pick up non-stack ones anyway.
> 
>> +	/*
>> +	 * All zones must have the same size, with the exception on an eventual
>> +	 * smaller last zone.
>> +	 */
>> +	if (zone->start + zone_sectors < capacity &&
>> +	    zone->len != zone_sectors) {
>> +		pr_warn("%s: Invalid zone device with non constant zone size\n",
>> +			disk->disk_name);
>> +		return false;
>> +	}
> 
> I think we should also move the power of two zone size check here
> instead of leaving it in the driver.

We should not since the drivers calls blk_queue_chunk_sectors() first to
set the zone size and that function has a power of 2 check. So better
check that earlier than here.

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

