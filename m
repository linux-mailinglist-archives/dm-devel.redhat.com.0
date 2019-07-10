Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EF63D642F6
	for <lists+dm-devel@lfdr.de>; Wed, 10 Jul 2019 09:37:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DC21307D910;
	Wed, 10 Jul 2019 07:37:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C1775D9CD;
	Wed, 10 Jul 2019 07:37:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DAA041F53;
	Wed, 10 Jul 2019 07:37:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6A0IaJK005823 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 20:18:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED5D65FCA9; Wed, 10 Jul 2019 00:18:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BEBF5FCA3;
	Wed, 10 Jul 2019 00:18:31 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2624A70E;
	Wed, 10 Jul 2019 00:17:21 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6A0G5tS108127; Wed, 10 Jul 2019 00:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id; s=corp-2018-07-02;
	bh=Tl4NPlTwN4w4WauSIyD+iVvbHjaN5x8ujC/tFJkHK/M=;
	b=rCVuFC7aBE09ybyJHa0dL0zyFdPc0RGsxinRor47w0I6v4wJ6ZPt4PfDKcyUZUsPbBsY
	QNyCz0f4RG+f7Jtcg1rEIdSdkpE7/L5Mj7fx7YzPQBPj/d/Am9UJMZbL04sCqsMoYsMJ
	MyuTGz+9pIotvtPlQ8Sm2u4Kk9PJVoyDbrFpVpHTs8XzJkHx63GpZCr45bQ7qJPbV2EY
	crmPCby8ji6efDH9hnhhBTAP06yhr94/6bzOh0W8cR+hdDUd4H+JMnHVSgMxZa+SEbBK
	cV0CjC3psG/N8Qp5n/EsiZQtbVwFaDfEWXfFdWrh/drkQD/C5kSpnc0A0EIM8/xMQsFD
	EA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 2tjkkpq4ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2019 00:17:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6A0D1GT049334; Wed, 10 Jul 2019 00:17:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 2tjjym32bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2019 00:17:20 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6A0HJou015894;
	Wed, 10 Jul 2019 00:17:19 GMT
Received: from jubi-laptop.us.oracle.com (/10.11.36.22)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 09 Jul 2019 17:17:18 -0700
From: Junxiao Bi <junxiao.bi@oracle.com>
To: dm-devel@redhat.com
Date: Tue,  9 Jul 2019 17:17:19 -0700
Message-Id: <20190710001719.2504-1-junxiao.bi@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1907100001
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9313
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1907100001
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 10 Jul 2019 00:18:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 10 Jul 2019 00:18:27 +0000 (UTC) for IP:'141.146.126.78'
	DOMAIN:'aserp2120.oracle.com' HELO:'aserp2120.oracle.com'
	FROM:'junxiao.bi@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 141.146.126.78 aserp2120.oracle.com 141.146.126.78
	aserp2120.oracle.com <junxiao.bi@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 10 Jul 2019 03:36:44 -0400
Cc: honglei.wang@oracle.com, mpatocka@redhat.com, agk@redhat.com,
	snitzer@redhat.com, junxiao.bi@oracle.com
Subject: [dm-devel] [PATCH v2] dm-bufio: fix deadlock with loop device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 10 Jul 2019 07:37:46 +0000 (UTC)

When thin-volume was built on loop device, if available memory is low,
the following deadlock can be triggered.

One process P1 was allocating memory with GFP_FS flag, direct alloc fail,
memory reclaim invoked memory shrinker in dm_bufio, dm_bufio_shrink_scan()
run, mutex dm_bufio_client->lock was acquired, then P1 wait for dm_buffer
io done in __try_evict_buffer->()__try_evict_buffer().

But this io may never done as it was issued to the underlying loop device
who forward it using fs direct-io, there some memory allocation were using
GFP_FS(like do_blockdev_direct_IO()), if direct alloc fail, memory reclaim
will invoke memory shrinker in dm_bufio, where dm_bufio_shrink_scan()
will be invoked, since the mutex was already hold by P1, the loop thread
will hung, io will never done. ABBA deadlock.

Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
---
Changes in v2:
  - refine the commit log

 drivers/md/dm-bufio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index 2a48ea3f1b30..b6b5acc92ca2 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -1599,9 +1599,7 @@ dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 	unsigned long freed;
 
 	c = container_of(shrink, struct dm_bufio_client, shrinker);
-	if (sc->gfp_mask & __GFP_FS)
-		dm_bufio_lock(c);
-	else if (!dm_bufio_trylock(c))
+	if (!dm_bufio_trylock(c))
 		return SHRINK_STOP;
 
 	freed  = __scan(c, sc->nr_to_scan, sc->gfp_mask);
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
