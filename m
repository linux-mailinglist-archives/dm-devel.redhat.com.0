Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3340B1BDD6C
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 15:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588166563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z5jQ31ENlb5x/C8homLDRhwl89B4BHC87P9EBlxeNYg=;
	b=WE/0gTr5UFSJxVKTyqUJIMkVpaIWq702Rfp1DWO8ONjuzj6sc1HEPN8VkpOAYKWGOPlkRC
	5A7tA0/wrDdmgLnPyAV8DDWt6MihQluDFwSp7CkO331lGpieJsN3+5CRgsE7Xgrx8EHYs7
	a9kAmaSLRevzFo28L8E5s4VfBsAl3CQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-GY8NGAXIP--wzx6MtUxjjw-1; Wed, 29 Apr 2020 09:22:40 -0400
X-MC-Unique: GY8NGAXIP--wzx6MtUxjjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09393EC1AA;
	Wed, 29 Apr 2020 13:22:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DFAF196AE;
	Wed, 29 Apr 2020 13:22:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A93E4CAA0;
	Wed, 29 Apr 2020 13:22:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TDMGUo003760 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 09:22:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 201622157F23; Wed, 29 Apr 2020 13:22:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AF622156A4C
	for <dm-devel@redhat.com>; Wed, 29 Apr 2020 13:22:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA5828008A3
	for <dm-devel@redhat.com>; Wed, 29 Apr 2020 13:22:04 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-228-otnI7wNPP_ufz_UIG01bvA-1; Wed, 29 Apr 2020 09:22:00 -0400
X-MC-Unique: otnI7wNPP_ufz_UIG01bvA-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03TDJQna122948; Wed, 29 Apr 2020 13:21:59 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 30p2p0b38u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Apr 2020 13:21:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03TDLwrx016012; Wed, 29 Apr 2020 13:21:58 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 30pvd10sn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Apr 2020 13:21:58 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03TDLj2B030704;
	Wed, 29 Apr 2020 13:21:46 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 29 Apr 2020 06:21:45 -0700
Date: Wed, 29 Apr 2020 16:21:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: heinzm@redhat.com
Message-ID: <20200429132140.GA815210@mwanda>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	mlxlogscore=737
	suspectscore=3 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
	mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004290113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	phishscore=0 clxscore=1011
	bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
	malwarescore=0
	mlxscore=0 suspectscore=3 mlxlogscore=785 priorityscore=1501
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004290112
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03TDMGUo003760
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [bug report] dm: add emulated block size target
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
Content-Disposition: inline

Hello Heinz Mauelshagen,

The patch d3d11ad3d087: "dm: add emulated block size target" from Mar
9, 2020, leads to the following static checker warning:

	drivers/md/dm-ebs-target.c:190 __ebs_process_bios()
	warn: assigning signed to unsigned: 'bio->bi_status = r' '(-4095)-0'

drivers/md/dm-ebs-target.c
   173                          if (__block_mod(bio_end_sector(bio), ec->u_bs) && block2 != block1)
   174                                  dm_bufio_prefetch(ec->bufio, block2, 1);
   175                  }
   176          }
   177  
   178          bio_list_for_each(bio, &bios) {
   179                  r = -EIO;
   180                  if (bio_op(bio) == REQ_OP_READ)
   181                          r = __ebs_rw_bio(ec, READ, bio);
   182                  else if (bio_op(bio) == REQ_OP_WRITE) {
   183                          write = true;
   184                          r = __ebs_rw_bio(ec, WRITE, bio);
   185                  } else if (bio_op(bio) == REQ_OP_DISCARD) {
   186                          /* FIXME: (optionally) call dm_bufio_discard_buffers() once upstream. */
   187                          r = __ebs_forget_bio(ec, bio);
   188                  }
   189  
   190                  bio->bi_status = r;
                        ^^^^^^^^^^^^^^^^^^
"r" is a negative error code and ->bi_status is a u8 so this won't work.

   191          }
   192  
   193          /*
   194           * We write dirty buffers after processing I/O on them
   195           * but before we endio thus addressing REQ_FUA/REQ_SYNC.
   196           */
   197          r = write ? dm_bufio_write_dirty_buffers(ec->bufio) : 0;

regards,
dan carpenter


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

