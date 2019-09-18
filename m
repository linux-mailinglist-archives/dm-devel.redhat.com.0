Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C7B7453
	for <lists+dm-devel@lfdr.de>; Thu, 19 Sep 2019 09:43:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A02A93DE31;
	Thu, 19 Sep 2019 07:43:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8174160933;
	Thu, 19 Sep 2019 07:43:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADDC74E58A;
	Thu, 19 Sep 2019 07:43:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8IFZM9O006663 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 11:35:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37AE060606; Wed, 18 Sep 2019 15:35:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 325E460872
	for <dm-devel@redhat.com>; Wed, 18 Sep 2019 15:35:19 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0993111B947
	for <dm-devel@redhat.com>; Wed, 18 Sep 2019 15:35:17 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x8IFWKfx077898
	for <dm-devel@redhat.com>; Wed, 18 Sep 2019 11:35:17 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2v3nry4ats-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <dm-devel@redhat.com>; Wed, 18 Sep 2019 11:35:16 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <dm-devel@redhat.com> from <maier@linux.ibm.com>;
	Wed, 18 Sep 2019 16:35:14 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 18 Sep 2019 16:35:08 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x8IFZ7e259703518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 18 Sep 2019 15:35:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAD8E5205A;
	Wed, 18 Sep 2019 15:35:06 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 458B352063;
	Wed, 18 Sep 2019 15:35:06 +0000 (GMT)
From: Steffen Maier <maier@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Doug Gilbert <dgilbert@interlog.com>
Date: Wed, 18 Sep 2019 17:34:45 +0200
X-TM-AS-GCONF: 00
x-cbid: 19091815-0020-0000-0000-0000036E9CA7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091815-0021-0000-0000-000021C4468C
Message-Id: <20190918153445.1241-1-maier@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-09-18_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1908290000 definitions=main-1909180152
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Wed, 18 Sep 2019 15:35:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Wed, 18 Sep 2019 15:35:17 +0000 (UTC) for IP:'148.163.158.5'
	DOMAIN:'mx0b-001b2d01.pphosted.com'
	HELO:'mx0a-001b2d01.pphosted.com' FROM:'maier@linux.ibm.com'
	RCPT:''
X-RedHat-Spam-Score: -0.7  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 148.163.158.5 mx0b-001b2d01.pphosted.com
	148.163.158.5 mx0b-001b2d01.pphosted.com <maier@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 19 Sep 2019 03:42:51 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	Benjamin Block <bblock@linux.ibm.com>,
	linux-scsi@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	Mark Brown <broonie@kernel.org>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	linux-kernel@vger.kernel.org, Omar Sandoval <osandov@fb.com>,
	linux-block@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	dm-devel@redhat.com, linux-next@vger.kernel.org,
	viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
	Steffen Maier <maier@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [dm-devel] [PATCH] compat_ioctl: fix reimplemented SG_IO handling
	causing -EINVAL from sg_io()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 19 Sep 2019 07:43:16 +0000 (UTC)

scsi_cmd_ioctl() had hdr as on stack auto variable and called
copy_{from,to}_user with the address operator &hdr and sizeof(hdr).

After the refactoring, {get,put}_sg_io_hdr() takes a pointer &hdr.
So the copy_{from,to}_user within the new helper functions should
just take the given pointer argument hdr and sizeof(*hdr).

I saw -EINVAL from sg_io() done by /usr/lib/udev/scsi_id which could
in turn no longer whitelist SCSI disks for devicemapper multipath.

Signed-off-by: Steffen Maier <maier@linux.ibm.com>
Fixes: 4f45155c29fd ("compat_ioctl: reimplement SG_IO handling")
---

Arnd, I'm not sure about the sizeof(hdr32) change in the compat part in
put_sg_io_hdr().

This is for next, probably via Arnd's y2038/y2038,
and it fixes next-20190917 for me regarding SCSI generic.

 block/scsi_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/scsi_ioctl.c b/block/scsi_ioctl.c
index cbeb629ee917..650bade5ea5a 100644
--- a/block/scsi_ioctl.c
+++ b/block/scsi_ioctl.c
@@ -607,14 +607,14 @@ int put_sg_io_hdr(const struct sg_io_hdr *hdr, void __user *argp)
 			.info		 = hdr->info,
 		};
 
-		if (copy_to_user(argp, &hdr32, sizeof(hdr)))
+		if (copy_to_user(argp, &hdr32, sizeof(hdr32)))
 			return -EFAULT;
 
 		return 0;
 	}
 #endif
 
-	if (copy_to_user(argp, &hdr, sizeof(hdr)))
+	if (copy_to_user(argp, hdr, sizeof(*hdr)))
 		return -EFAULT;
 
 	return 0;
@@ -659,7 +659,7 @@ int get_sg_io_hdr(struct sg_io_hdr *hdr, const void __user *argp)
 	}
 #endif
 
-	if (copy_from_user(&hdr, argp, sizeof(hdr)))
+	if (copy_from_user(hdr, argp, sizeof(*hdr)))
 		return -EFAULT;
 
 	return 0;
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
