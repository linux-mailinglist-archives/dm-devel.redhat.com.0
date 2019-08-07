Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAF985B7F
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 09:22:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29AC688302;
	Thu,  8 Aug 2019 07:22:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C309A10016EB;
	Thu,  8 Aug 2019 07:22:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63E722551C;
	Thu,  8 Aug 2019 07:22:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x77EoJ0G031399 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 10:50:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C3286046B; Wed,  7 Aug 2019 14:50:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03332601B7
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 14:50:12 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9277085540
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 14:50:11 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x77EknTv068330
	for <dm-devel@redhat.com>; Wed, 7 Aug 2019 10:50:11 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2u7yp0kcnh-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <dm-devel@redhat.com>; Wed, 07 Aug 2019 10:50:10 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <dm-devel@redhat.com> from <maier@linux.ibm.com>;
	Wed, 7 Aug 2019 15:50:08 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 7 Aug 2019 15:50:03 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x77EnhnL29163932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 7 Aug 2019 14:49:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F3FB11C073;
	Wed,  7 Aug 2019 14:50:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE6B511C064;
	Wed,  7 Aug 2019 14:50:00 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  7 Aug 2019 14:50:00 +0000 (GMT)
From: Steffen Maier <maier@linux.ibm.com>
To: "James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Ming Lei <ming.lei@redhat.com>
Date: Wed,  7 Aug 2019 16:49:46 +0200
X-TM-AS-GCONF: 00
x-cbid: 19080714-0028-0000-0000-0000038C9A2B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080714-0029-0000-0000-0000244CFF51
Message-Id: <20190807144948.28265-1-maier@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-08-07_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=796 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1906280000 definitions=main-1908070158
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Wed, 07 Aug 2019 14:50:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 07 Aug 2019 14:50:11 +0000 (UTC) for IP:'148.163.156.1'
	DOMAIN:'mx0a-001b2d01.pphosted.com'
	HELO:'mx0a-001b2d01.pphosted.com' FROM:'maier@linux.ibm.com'
	RCPT:''
X-RedHat-Spam-Score: -0.7  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 148.163.156.1 mx0a-001b2d01.pphosted.com
	148.163.156.1 mx0a-001b2d01.pphosted.com <maier@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 08 Aug 2019 03:21:19 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	Benjamin Block <bblock@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Hannes Reinecke <hare@suse.com>, "Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-next@vger.kernel.org, Steffen Maier <maier@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: [dm-devel] [PATCH 0/2] scsi: core: regression fixes for request
	batching
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 08 Aug 2019 07:22:20 +0000 (UTC)

Hi James, Martin, Paolo, Ming,

multipathing with linux-next is broken since 20190723 in our CI.
The patches fix a memleak and a severe dh/multipath functional regression.
It would be nice if we could get them to 5.4/scsi-queue and also next.

I would have preferred if such a new feature had used its own
new copy scsi_mq_ops_batching instead of changing the use case and
semantics of the existing scsi_mq_ops, because this would likely
cause less regressions for all the other users not using the new feature.

Steffen Maier (2):
  scsi: core: fix missing .cleanup_rq for SCSI hosts without request
    batching
  scsi: core: fix dh and multipathing for SCSI hosts without request
    batching

 drivers/scsi/scsi_lib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
