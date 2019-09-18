Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 42474B6703
	for <lists+dm-devel@lfdr.de>; Wed, 18 Sep 2019 17:24:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 359D065F25;
	Wed, 18 Sep 2019 15:24:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB2A5D9E1;
	Wed, 18 Sep 2019 15:24:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 014103FA5E;
	Wed, 18 Sep 2019 15:24:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8IFNdVr005941 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 11:23:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0AD2D60619; Wed, 18 Sep 2019 15:23:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 060E26060D;
	Wed, 18 Sep 2019 15:23:28 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95BBC30842B5;
	Wed, 18 Sep 2019 15:23:04 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x8IFEr1N150047; Wed, 18 Sep 2019 15:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=to : cc : subject :
	from : references : date : in-reply-to : message-id : mime-version :
	content-type; s=corp-2019-08-05;
	bh=QP/of89H1iKlQJSJwjQxXAmLxnPt3PCrIeV/m5qNqgE=;
	b=nXx8GMbC4L/o3mQfkXRyVvElpxXXkG2pJeE86ZX+eKYDfswZwENGjCYP0eMI3gHV/xwx
	rv7xiC3frDk0mN2dWtIzIcEsDSkLaWyw5VSi5ljx5BsY6k9tcG85ootU1svDbRWsRqzO
	d0XWre/wJR74pYg3YNM17FkIZC/9WvJlA/TcvISHbGxh35jZ/lovnUM62AyyEI4YdsPs
	sIdIdEOK6NfsVuxKyU9pR2EYhvOTQsfrc2bzDMXJpkhils/p6MmCa5F2/qK3qtbTY+Ii
	h3jo7tGb4IgexyBH0K/bdWtHSfzczGFWM1AKnAoNSWjMFrF/cut4wNCb9apfyNmy5RIn
	Rg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 2v385dvnrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Sep 2019 15:22:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x8IFDpWL161853; Wed, 18 Sep 2019 15:22:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3020.oracle.com with ESMTP id 2v37mmt1b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Sep 2019 15:22:49 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8IFMhWn002796;
	Wed, 18 Sep 2019 15:22:43 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 18 Sep 2019 08:22:42 -0700
To: Steffen Maier <maier@linux.ibm.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190807144948.28265-1-maier@linux.ibm.com>
	<20190807144948.28265-2-maier@linux.ibm.com>
	<CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
	<yq136iccsbw.fsf@oracle.com>
	<bec80a65-9a8c-54a9-fe70-876fcbe3d592@linux.ibm.com>
Date: Wed, 18 Sep 2019 11:22:39 -0400
In-Reply-To: <bec80a65-9a8c-54a9-fe70-876fcbe3d592@linux.ibm.com> (Steffen
	Maier's message of "Wed, 18 Sep 2019 17:09:50 +0200")
Message-ID: <yq1lful8w8w.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1908290000 definitions=main-1909180151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
	definitions=main-1909180151
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Wed, 18 Sep 2019 15:23:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 18 Sep 2019 15:23:25 +0000 (UTC) for IP:'156.151.31.85'
	DOMAIN:'userp2120.oracle.com' HELO:'userp2120.oracle.com'
	FROM:'martin.petersen@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.85 userp2120.oracle.com 156.151.31.85
	userp2120.oracle.com <martin.petersen@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390 <linux-s390@vger.kernel.org>,
	Benjamin Block <bblock@linux.ibm.com>,
	Linux SCSI List <linux-scsi@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ming Lei <tom.leiming@gmail.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Hannes Reinecke <hare@suse.com>, "Ewan D . Milne" <emilne@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block <linux-block@vger.kernel.org>,
	"open list:DEVICE-MAPPER \(LVM\)" <dm-devel@redhat.com>,
	Mark Brown <broonie@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH 1/2] scsi: core: fix missing .cleanup_rq for
	SCSI hosts without request batching
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 18 Sep 2019 15:24:41 +0000 (UTC)


Steffen,

> Martin, is it possible that you re-wrote your for-next and it now no
> longer contains a merged 5.4/scsi-postmerge with those fixes?  At
> least I cannot find the fix code in next-20190917 and it fails again
> for me.

Yes, looks like you're right. Not sure how I managed to mess that up. I
must have inadvertently done a reset in the wrong worktree because my
for-next branch maintenance script only does merges.

In any case, since Linus has pulled the block tree dependencies, I'll
rebase the postmerge branch on top of current linus/master and create a
new for-next.

Thanks for the heads-up!

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
