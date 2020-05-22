Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DD2DE1DE80B
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 15:29:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590154180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kB/j9k/1es/UspUA6uZsHNHih2vuxNMs3Rzj+yT3ZMc=;
	b=KE4X9xrKstLktfM1UbGIXAeTyxTMULzEo8f8h3oRewUfWhufZci9pB8dVyp8ErzXYSUQzP
	6T2w7hpKNdVEnld+nvXkpaO6Ro1egOyFs2rJiu7+0xawHWZCBoQ3GTS4l3ZKvhRuDe96r3
	OLJQma87E+Elf0dhiRpTaqug1twI2Iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-VHLtYXjrOqymCkiDPQOtqg-1; Fri, 22 May 2020 09:29:39 -0400
X-MC-Unique: VHLtYXjrOqymCkiDPQOtqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED910107ACCA;
	Fri, 22 May 2020 13:29:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEA7047359;
	Fri, 22 May 2020 13:29:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CB6A54D0B;
	Fri, 22 May 2020 13:29:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MDT3fK002841 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 09:29:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13E29F1C76; Fri, 22 May 2020 13:29:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D810F1C9F
	for <dm-devel@redhat.com>; Fri, 22 May 2020 13:29:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 202AD800A1A
	for <dm-devel@redhat.com>; Fri, 22 May 2020 13:28:58 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-185-PPCbXQKXPPe3yGhiigjSKw-1; Fri, 22 May 2020 09:28:56 -0400
X-MC-Unique: PPCbXQKXPPe3yGhiigjSKw-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	04MDRWFn100636; Fri, 22 May 2020 13:28:47 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 31501rm95f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 22 May 2020 13:28:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	04MDSjh4174114; Fri, 22 May 2020 13:28:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3030.oracle.com with ESMTP id 313gj7g554-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 May 2020 13:28:46 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04MDSdHN010303;
	Fri, 22 May 2020 13:28:40 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 22 May 2020 06:28:38 -0700
To: Damien Le Moal <Damien.LeMoal@wdc.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1lflkp0b9.fsf@ca-mkp.ca.oracle.com>
References: <20200514065819.1113949-1-damien.lemoal@wdc.com>
	<BY5PR04MB6900144BD2729172EBF5DF2EE7B40@BY5PR04MB6900.namprd04.prod.outlook.com>
Date: Fri, 22 May 2020 09:28:36 -0400
In-Reply-To: <BY5PR04MB6900144BD2729172EBF5DF2EE7B40@BY5PR04MB6900.namprd04.prod.outlook.com>
	(Damien Le Moal's message of "Fri, 22 May 2020 07:27:11 +0000")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0 malwarescore=0
	mlxscore=0 adultscore=0 bulkscore=0 suspectscore=1 mlxlogscore=862
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2005220110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	lowpriorityscore=0 spamscore=0
	mlxlogscore=895 clxscore=1015 priorityscore=1501 cotscore=-2147483648
	impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
	mlxscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
	scancount=1
	engine=8.12.0-2004280000 definitions=main-2005220110
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Keith Busch <kbusch@kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Damien,

>> +	if (t->io_opt & (t->physical_block_size - 1))
>> +		t->io_opt = lcm(t->io_opt, t->physical_block_size);

> Any comment on this patch ?  Note: the patch the patch "nvme: Fix
> io_opt limit setting" is already queued for 5.8.

Setting io_opt to the physical block size is not correct.

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

