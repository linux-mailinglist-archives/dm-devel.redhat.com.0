Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A8D91274C23
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 00:33:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-5IABPBLpO4KeCgzLjFseGw-1; Tue, 22 Sep 2020 18:33:33 -0400
X-MC-Unique: 5IABPBLpO4KeCgzLjFseGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0D6D1005E64;
	Tue, 22 Sep 2020 22:33:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B930460C05;
	Tue, 22 Sep 2020 22:33:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A93881826D30;
	Tue, 22 Sep 2020 22:33:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08MMXG5h029893 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 18:33:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E8E31000D8A; Tue, 22 Sep 2020 22:33:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58AAD10EE6CF
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 22:33:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DD40858294
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 22:33:09 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-480-mUhLZh16MCuaTQlcs3KFpQ-1; Tue, 22 Sep 2020 18:33:07 -0400
X-MC-Unique: mUhLZh16MCuaTQlcs3KFpQ-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08MJTLAh037210; Tue, 22 Sep 2020 19:30:39 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 33q5rgd3wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 22 Sep 2020 19:30:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08MJPPm7154691; Tue, 22 Sep 2020 19:30:38 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 33nuwyvnbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Sep 2020 19:30:38 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08MJUanE025084;
	Tue, 22 Sep 2020 19:30:37 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 22 Sep 2020 12:30:36 -0700
To: Mike Snitzer <snitzer@redhat.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1wo0lpq2d.fsf@ca-mkp.ca.oracle.com>
References: <20200922023251.47712-1-snitzer@redhat.com>
	<20200922023251.47712-5-snitzer@redhat.com>
Date: Tue, 22 Sep 2020 15:30:34 -0400
In-Reply-To: <20200922023251.47712-5-snitzer@redhat.com> (Mike Snitzer's
	message of "Mon, 21 Sep 2020 22:32:49 -0400")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	mlxscore=0 adultscore=0
	bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=1 spamscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009220151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	impostorscore=0
	clxscore=1011 suspectscore=1 phishscore=0 malwarescore=0
	priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009220151
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 4/6] block: allow 'chunk_sectors' to be
	non-power-of-2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Mike,

> It is possible, albeit more unlikely, for a block device to have a non
> power-of-2 for chunk_sectors (e.g. 10+2 RAID6 with 128K chunk_sectors,
> which results in a full-stripe size of 1280K. This causes the RAID6's
> io_opt to be advertised as 1280K, and a stacked device _could_ then be
> made to use a blocksize, aka chunk_sectors, that matches non
> power-of-2 io_opt of underlying RAID6 -- resulting in stacked device's
> chunk_sectors being a non power-of-2).
>
> Update blk_queue_chunk_sectors() and blk_max_size_offset() to
> accommodate drivers that need a non power-of-2 chunk_sectors.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

