Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B12920D4
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 11:59:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24B49190C100;
	Mon, 19 Aug 2019 09:59:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 300031F0;
	Mon, 19 Aug 2019 09:59:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55A3524FDF;
	Mon, 19 Aug 2019 09:59:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7J9xHrT001965 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 05:59:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B48EF6DB; Mon, 19 Aug 2019 09:59:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A2152CF;
	Mon, 19 Aug 2019 09:59:13 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34CF43090FC7;
	Mon, 19 Aug 2019 09:58:44 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x7J9rhaa098649; Mon, 19 Aug 2019 09:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : mime-version : content-type; s=corp-2019-08-05;
	bh=/JPBDryUKLOaTIk25HI3UZTIzR+WQxu3bdPh/x3jHB4=;
	b=XNGwQkDNGSQuvpl7FFpKB/LhwnWOZ5gk2seoUthcqIUrQLvtyqh+Pr3jQ2nhJHyv+Fe4
	XxNmvSmfSlLlL7pDgxA7Jb4RL1Nl36gEyNrWHwuPe1pabvlU6WTEzVjSohKbT7j9xN/g
	WnNMb2tkMmmIxS/G+7/lWcbbNEdVxQxNAv3txXapa2KDCGu7NQO9mlATgXlZkzP2YyKO
	ZCz12jGbuc+p2BtowYSwRMB3csfuUo+wN1vGvH8HJzqKZ5xw7Y4ShBh9Ja+xa/JK1czX
	I3KKGJXK7l59G3SnMgQod9QG8FgXKqNGdB4j+z3rkIfMeyPak3sECIabm8m73jB4vQ/K
	dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 2ue90t6hsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2019 09:58:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x7J9wYPq020419; Mon, 19 Aug 2019 09:58:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 2ufb46j328-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2019 09:58:40 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7J9wKgK001195;
	Mon, 19 Aug 2019 09:58:20 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 19 Aug 2019 02:58:20 -0700
Date: Mon, 19 Aug 2019 12:58:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alasdair Kergon <agk@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>
Message-ID: <20190819095814.GA19905@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353
	signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1908190114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353
	signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1908190113
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Mon, 19 Aug 2019 09:59:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 19 Aug 2019 09:59:09 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'dan.carpenter@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kernel-janitors@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH] dm zoned: Potential NULL dereference in
	dmz_do_reclaim()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Mon, 19 Aug 2019 09:59:29 +0000 (UTC)

This function is supposed to return error pointers so it matches the
dmz_get_rnd_zone_for_reclaim() function.  The current code could lead to
a NULL dereference in dmz_do_reclaim()

Fixes: b234c6d7a703 ("dm zoned: improve error handling in reclaim")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/md/dm-zoned-metadata.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 2a5bc51fd6d5..595a73110e17 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1588,7 +1588,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 	struct dm_zone *zone;
 
 	if (list_empty(&zmd->map_seq_list))
-		return NULL;
+		return ERR_PTR(-EBUSY);
 
 	list_for_each_entry(zone, &zmd->map_seq_list, link) {
 		if (!zone->bzone)
@@ -1597,7 +1597,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 			return zone;
 	}
 
-	return NULL;
+	return ERR_PTR(-EBUSY);
 }
 
 /*
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
