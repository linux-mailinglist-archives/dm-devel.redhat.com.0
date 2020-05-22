Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9FD1DE825
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 15:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590154616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KheGSoP8tWe2tQ2qaq4wNv/3pOqi7dR6Sd8kSGkRBPA=;
	b=MZEXIrvCbnbbxyUJveOrI1KFCcJQyYrycQIWKC988DAE2DuhF7rFnf5EvA6Be2DMniIZf4
	W5t5OK0bwfUP1e8m377mD2GySli6y4W89/bXagwAjfuAJSWwO9lnl6yzgpGvbfrEHSN7FK
	xOBn9oY/nTQiJzetwlJ5uHuZP3urQeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-MzlDIuPZPWqmXNf-EUzyoA-1; Fri, 22 May 2020 09:36:53 -0400
X-MC-Unique: MzlDIuPZPWqmXNf-EUzyoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D135108BD10;
	Fri, 22 May 2020 13:36:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C97DB5C1D2;
	Fri, 22 May 2020 13:36:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 342BA1809543;
	Fri, 22 May 2020 13:36:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MDaZNi003258 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 09:36:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 244262029F70; Fri, 22 May 2020 13:36:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F047E2029F61
	for <dm-devel@redhat.com>; Fri, 22 May 2020 13:36:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9969B180122B
	for <dm-devel@redhat.com>; Fri, 22 May 2020 13:36:32 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-481-h5yozpmSNLCBatseomzi7A-1; Fri, 22 May 2020 09:36:28 -0400
X-MC-Unique: h5yozpmSNLCBatseomzi7A-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	04MDNNTL158770; Fri, 22 May 2020 13:36:22 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 3127krntfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 22 May 2020 13:36:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	04MDSivM174067; Fri, 22 May 2020 13:36:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 313gj7gghx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 May 2020 13:36:21 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04MDaKhJ008637;
	Fri, 22 May 2020 13:36:20 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 22 May 2020 06:36:20 -0700
To: "Martin K. Petersen" <martin.petersen@oracle.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1ftbsp06e.fsf@ca-mkp.ca.oracle.com>
References: <20200514065819.1113949-1-damien.lemoal@wdc.com>
	<BY5PR04MB6900144BD2729172EBF5DF2EE7B40@BY5PR04MB6900.namprd04.prod.outlook.com>
	<yq1lflkp0b9.fsf@ca-mkp.ca.oracle.com>
Date: Fri, 22 May 2020 09:36:18 -0400
In-Reply-To: <yq1lflkp0b9.fsf@ca-mkp.ca.oracle.com> (Martin K. Petersen's
	message of "Fri, 22 May 2020 09:28:36 -0400")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0 malwarescore=0
	mlxscore=0 adultscore=0 bulkscore=0 suspectscore=1 mlxlogscore=901
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2005220110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	phishscore=0 spamscore=0
	bulkscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 impostorscore=0
	suspectscore=1 mlxlogscore=924 malwarescore=0 cotscore=-2147483648
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2005220110
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <Damien.LeMoal@wdc.com>,
	Mike Snitzer <snitzer@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Busch <kbusch@kernel.org>, Keith
Subject: Re: [dm-devel] [PATCH] block: Improve io_opt limit stacking
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


>>> +	if (t->io_opt & (t->physical_block_size - 1))
>>> +		t->io_opt = lcm(t->io_opt, t->physical_block_size);
>
>> Any comment on this patch ?  Note: the patch the patch "nvme: Fix
>> io_opt limit setting" is already queued for 5.8.
>
> Setting io_opt to the physical block size is not correct.

Oh, missed the lcm(). But I'm still concerned about twiddling io_opt to
a value different than the one reported by an underlying device.

Setting io_opt to something that's less than a full stripe width in a
RAID, for instance, doesn't produce the expected result. So I think I'd
prefer not to set io_opt at all if it isn't consistent across all the
stacked devices.

Let me chew on it for a bit...

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

