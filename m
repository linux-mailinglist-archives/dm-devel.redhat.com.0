Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id A094C192242
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:14:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585124042;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4fmm+OV/y3I+k9eMV2ebiKNsVHsB5GAado1dLd06OMI=;
	b=MQVDQUfMVRuJxiwYl8ViLyo2FBNGFXhT5HZ86CFfTESvlw/ey5y0aty2zmvT5pejnfjOHT
	TUbOPnnq/ZeI8b7s5YE8gn0xQgwGgjerAZ+A+hR0Xr1dYy9LB/dv4SjGJGxbrfydcAv8mJ
	hK9oi/FaaWU2Y/0yCkJRk3l4KYwkpVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-jpe8mKfgN02IaBzhdvUbkQ-1; Wed, 25 Mar 2020 04:13:21 -0400
X-MC-Unique: jpe8mKfgN02IaBzhdvUbkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D66B3DB2D;
	Wed, 25 Mar 2020 08:13:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ADBA91293;
	Wed, 25 Mar 2020 08:13:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F194C86385;
	Wed, 25 Mar 2020 08:13:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OB3U7v008792 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 07:03:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 625E52166B2B; Tue, 24 Mar 2020 11:03:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5EB2166B2A
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 11:03:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25ECE8F7830
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 11:03:28 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-309-pZmbHICQNAqXgOzSu72vZA-1; Tue, 24 Mar 2020 07:03:25 -0400
X-MC-Unique: pZmbHICQNAqXgOzSu72vZA-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02OAsEGM039518; Tue, 24 Mar 2020 11:03:24 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 2yx8ac0jvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 11:03:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02OApXjK110378; Tue, 24 Mar 2020 11:03:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 2yxw6mfp69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 11:03:24 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02OB3MdY025839;
	Tue, 24 Mar 2020 11:03:22 GMT
Received: from localhost.localdomain (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 24 Mar 2020 04:03:22 -0700
From: Bob Liu <bob.liu@oracle.com>
To: dm-devel@redhat.com
Date: Tue, 24 Mar 2020 19:02:52 +0800
Message-Id: <20200324110255.8385-1-bob.liu@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	adultscore=0
	malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=765 bulkscore=0
	phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	clxscore=1015
	lowpriorityscore=0 suspectscore=1 priorityscore=1501 malwarescore=0
	mlxscore=0 adultscore=0 phishscore=0 impostorscore=0 mlxlogscore=839
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240059
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02OB3U7v008792
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 25 Mar 2020 04:12:59 -0400
Cc: linux-block@vger.kernel.org, Dmitry.Fomichev@wdc.com, Damien.LeMoal@wdc.com,
	Bob Liu <bob.liu@oracle.com>
Subject: [dm-devel] [RFC PATCH v2 0/3] dm zoned: extend the way of exposing
	zoned block device
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Motivation:
dm-zoned exposes a zoned block device(ZBC) as a regular block device by storing
metadata and buffering random writes in its conventional zones.
This way is not flexible, there must be enough conventional zones and the
performance may be constrained.

This patchset split the metadata from zoned device to an extra regular device,
with aim to increase the flexibility and potential performance.
For example, now we can store metadata in a faster device like persistent memory.
Also random writes can go to the regular devices in this version.

Usage(will send user space patches later):
> dmzadm --format $zoned_dev --regular=$regu_dev --force
> echo "0 $size zoned $regu_dev $zoned_dev" | dmsetup create $dm-zoned-name

v2:
 * emulate regular device zone info
 * support write both metadata and random writes to regular dev

Bob Liu (3):
  dm zoned: rename dev name to zoned_dev
  dm zoned: introduce regular device to dm-zoned-target
  dm zoned: add regular device info to metadata

 drivers/md/dm-zoned-metadata.c | 205 +++++++++++++++++++++++++++--------------
 drivers/md/dm-zoned-target.c   | 205 +++++++++++++++++++++++------------------
 drivers/md/dm-zoned.h          |  53 ++++++++++-
 3 files changed, 299 insertions(+), 164 deletions(-)

-- 
2.9.5


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

