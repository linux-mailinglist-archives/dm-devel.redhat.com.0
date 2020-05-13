Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20A841D0C72
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 11:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589362789;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QKyTH9Cq/pkPxMXwxVzrLDGcRE7yDVOZ3+lhG4t3Q4U=;
	b=HwN/tzBY1Tpn1LeNqugouYJ5gZiHD9S3FTbGDc36AhDjDNwEBshi9TnTkgNbzzAD768KMk
	3IIECBEWlboKK1zxkH7NkP1QgNG/5qopwZP04tNgxn0lhDFFYSBi6F9qzpPT/FuCsG9eZ2
	navCmXSLeig41CijBK/H3NM4zATniOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-cbwTkIB_NgWtPBwovRtlQA-1; Wed, 13 May 2020 05:39:46 -0400
X-MC-Unique: cbwTkIB_NgWtPBwovRtlQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA6851005510;
	Wed, 13 May 2020 09:39:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A250638E;
	Wed, 13 May 2020 09:39:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 708404CAA0;
	Wed, 13 May 2020 09:39:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D9ctqU004618 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 05:38:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2BB022156A4A; Wed, 13 May 2020 09:38:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2578D2156A49
	for <dm-devel@redhat.com>; Wed, 13 May 2020 09:38:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B6371049841
	for <dm-devel@redhat.com>; Wed, 13 May 2020 09:38:52 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-258-qQuBLgOoPR6yEG5OlTQIqA-1; Wed, 13 May 2020 05:38:49 -0400
X-MC-Unique: qQuBLgOoPR6yEG5OlTQIqA-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	04D9ckMV164466; Wed, 13 May 2020 09:38:48 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 3100yfu53r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 13 May 2020 09:38:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	04D9I1kF012360; Wed, 13 May 2020 09:36:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3030.oracle.com with ESMTP id 3100ye7kqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 May 2020 09:36:48 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04D9al1D026089;
	Wed, 13 May 2020 09:36:47 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 13 May 2020 02:36:46 -0700
Date: Wed, 13 May 2020 12:36:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: hare@suse.de
Message-ID: <20200513093616.GA347693@mwanda>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	malwarescore=0 bulkscore=0
	phishscore=0 suspectscore=3 adultscore=0 mlxscore=0 mlxlogscore=884
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2005130086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	lowpriorityscore=0 adultscore=0
	cotscore=-2147483648 mlxscore=0 suspectscore=3 spamscore=0
	impostorscore=0
	mlxlogscore=913 malwarescore=0 clxscore=1011 phishscore=0 bulkscore=0
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2005130088
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [bug report] dm zoned: metadata version 2
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

Hello Hannes Reinecke,

The patch 70978208ec91: "dm zoned: metadata version 2" from May 11,
2020, leads to the following static checker warning:

	drivers/md/dm-zoned-target.c:1047 dmz_iterate_devices()
	warn: was expecting a 64 bit value instead of '~(zone_nr_sectors - 1)'

drivers/md/dm-zoned-target.c
  1039  static int dmz_iterate_devices(struct dm_target *ti,
  1040                                 iterate_devices_callout_fn fn, void *data)
  1041  {
  1042          struct dmz_target *dmz = ti->private;
  1043          unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
  1044          sector_t capacity;
  1045          int r;
  1046  
  1047          capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);

sector_t is a u64 and zone_nr_sectors is a u32.  It means that the high
32 bits are always cleared.  Making zone_nr_sectors a sector_t, u64 or
even an int would fix this problem.

  1048          r = fn(ti, dmz->ddev[0], 0, capacity, data);
  1049          if (!r && dmz->ddev[1]) {
  1050                  capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
  1051                  r = fn(ti, dmz->ddev[1], 0, capacity, data);
  1052          }
  1053          return r;
  1054  }

regards,
dan carpenter

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

