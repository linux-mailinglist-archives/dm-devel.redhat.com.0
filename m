Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E06662D0
	for <lists+dm-devel@lfdr.de>; Fri, 12 Jul 2019 02:25:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 025F0308FC4B;
	Fri, 12 Jul 2019 00:25:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB9C75DDFE;
	Fri, 12 Jul 2019 00:25:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECC2641F40;
	Fri, 12 Jul 2019 00:25:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6C0PPSF013422 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Jul 2019 20:25:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1441D19C6A; Fri, 12 Jul 2019 00:25:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFE7619C4F;
	Fri, 12 Jul 2019 00:25:20 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 866DC6EB81;
	Fri, 12 Jul 2019 00:24:41 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6C0O1Os087021; Fri, 12 Jul 2019 00:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=to : cc : subject :
	from : references : date : in-reply-to : message-id : mime-version :
	content-type; s=corp-2018-07-02;
	bh=/7iUAjA8hocsPRyoS5IWsNkk25nMXlZ5eQiVR+FIJr4=;
	b=v29BE733dwH3SnVG34MQg+iO6EYVU7rKwB57P7Fk79bMB8zTouHJtPF3QcLyErF0lgPK
	Arl8iEso7HUGmPgNnGAvvKJio6PxWS/xd0OgG/FQBEbJwgfUSIg27ZQB8OwUPniuSpq9
	5+D9vkET/Xg1/C9RrU+TRPGCF3B1OmYd3/oO3qlq8olxq0lsRousudBGnexZkEpY5/VP
	EQAWPty4cv5/VO0mPMHY1+rZsZU9IehboRmR7iUiL7YfNfDMv9ek2tcQ2F1pF8xezKmt
	QFQntd1jyJx04XQZBM4ZaO00u7JcYBHGjadR24R257zrVeUfPIwS+p86omF2brc6DSre
	aA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 2tjm9r2tnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jul 2019 00:24:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6C0NHId106653; Fri, 12 Jul 2019 00:24:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3030.oracle.com with ESMTP id 2tmwgyfajd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jul 2019 00:24:23 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6C0OL8f013001;
	Fri, 12 Jul 2019 00:24:22 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 11 Jul 2019 17:24:21 -0700
To: Damien Le Moal <damien.lemoal@wdc.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
	<20190701050918.27511-3-damien.lemoal@wdc.com>
Date: Thu, 11 Jul 2019 20:24:18 -0400
In-Reply-To: <20190701050918.27511-3-damien.lemoal@wdc.com> (Damien Le Moal's
	message of "Mon, 1 Jul 2019 14:09:16 +0900")
Message-ID: <yq11ryw9k25.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=705
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1907120003
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=751
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1907120003
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 12 Jul 2019 00:25:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 12 Jul 2019 00:25:17 +0000 (UTC) for IP:'156.151.31.85'
	DOMAIN:'userp2120.oracle.com' HELO:'userp2120.oracle.com'
	FROM:'martin.petersen@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.85 userp2120.oracle.com 156.151.31.85
	userp2120.oracle.com <martin.petersen@oracle.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH V6 2/4] block: Kill gfp_t argument of
	blkdev_report_zones()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 12 Jul 2019 00:25:31 +0000 (UTC)


Damien,

> Only GFP_KERNEL and GFP_NOIO are used with blkdev_report_zones(). In
> preparation of using vmalloc() for large report buffer and zone array
> allocations used by this function, remove its "gfp_t gfp_mask" argument
> and rely on the caller context to use memalloc_noio_save/restore() where
> necessary (block layer zone revalidation and dm-zoned I/O error path).

LGTM.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
