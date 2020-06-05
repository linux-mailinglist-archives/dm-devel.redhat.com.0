Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A9A4E1F03DB
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5mQRFHRot8tGleYy7j+1PTxNanamg3DwJy87pcIgrTc=;
	b=ci3MSEWnIvIXkx/NVwRpSetpnhlKoTgX7fCHB/UFC0dTW35aYgUBJF1iliLs2DoMz04lmj
	Fpbxewm2pVp6K9DiXUFZY8Ay+NmzxfnK77S1wLOEVMuPppMq4wlI3gWd6vdkMWBnkSE3S4
	dSWVGnT5OBQ9TEfK2D3wHZ8/OMLz4Do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-1CK1DjRgPQO2pdVoESlo0A-1; Fri, 05 Jun 2020 20:23:31 -0400
X-MC-Unique: 1CK1DjRgPQO2pdVoESlo0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E26101856973;
	Sat,  6 Jun 2020 00:23:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B691310013D0;
	Sat,  6 Jun 2020 00:23:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54201181ABC6;
	Sat,  6 Jun 2020 00:23:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055CbORM029848 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 08:37:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6D3F2029F78; Fri,  5 Jun 2020 12:37:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A3942029F80
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 12:37:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83FF5196EF84
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 12:37:20 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-99-X2s23BtBMsW1UBgqDeBhyg-1; Fri, 05 Jun 2020 08:37:18 -0400
X-MC-Unique: X2s23BtBMsW1UBgqDeBhyg-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	055CW5Mg098499; Fri, 5 Jun 2020 12:37:17 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 31f9242ms8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 05 Jun 2020 12:37:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	055CY9Hh163393; Fri, 5 Jun 2020 12:37:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 31f92766pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2020 12:37:16 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 055CbGBl007358;
	Fri, 5 Jun 2020 12:37:16 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 05 Jun 2020 05:37:15 -0700
Date: Fri, 5 Jun 2020 15:37:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: hare@suse.de
Message-ID: <20200605123710.GA988175@mwanda>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9642
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	phishscore=0
	mlxlogscore=999 bulkscore=0 suspectscore=10 adultscore=0 malwarescore=0
	mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2006050093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9642
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
	impostorscore=0
	adultscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0
	lowpriorityscore=0 cotscore=-2147483648 phishscore=0 spamscore=0
	malwarescore=0 suspectscore=10 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2006050093
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [bug report] dm zoned: per-device reclaim
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Hannes Reinecke,

The patch a99e0ceaa832: "dm zoned: per-device reclaim" from Jun 2,
2020, leads to the following static checker warning:

	drivers/md/dm-zoned-reclaim.c:428 dmz_do_reclaim()
	error: potentially dereferencing uninitialized 'rzone'.

drivers/md/dm-zoned-reclaim.c
   364  static int dmz_do_reclaim(struct dmz_reclaim *zrc)
   365  {
   366          struct dmz_metadata *zmd = zrc->metadata;
   367          struct dm_zone *dzone;
   368          struct dm_zone *rzone;
                                ^^^^^

   369          unsigned long start;
   370          int ret;
   371  
   372          /* Get a data zone */
   373          dzone = dmz_get_zone_for_reclaim(zmd, zrc->dev_idx,
   374                                           dmz_target_idle(zrc));
   375          if (!dzone) {
   376                  DMDEBUG("(%s/%u): No zone found to reclaim",
   377                          dmz_metadata_label(zmd), zrc->dev_idx);
   378                  return -EBUSY;
   379          }
   380  
   381          start = jiffies;
   382          if (dmz_is_cache(dzone) || dmz_is_rnd(dzone)) {
   383                  if (!dmz_weight(dzone)) {
   384                          /* Empty zone */
   385                          dmz_reclaim_empty(zrc, dzone);
   386                          ret = 0;
   387                  } else {
   388                          /*
   389                           * Reclaim the random data zone by moving its
   390                           * valid data blocks to a free sequential zone.
   391                           */
   392                          ret = dmz_reclaim_rnd_data(zrc, dzone);
   393                  }
   394                  rzone = dzone;
   395  
   396          } else {
   397                  struct dm_zone *bzone = dzone->bzone;
   398                  sector_t chunk_block = 0;
   399  
   400                  ret = dmz_first_valid_block(zmd, bzone, &chunk_block);
   401                  if (ret < 0)
   402                          goto out;

"rzone" is uninitialized if "ret < 0".

   403  
   404                  if (ret == 0 || chunk_block >= dzone->wp_block) {
   405                          /*
   406                           * The buffer zone is empty or its valid blocks are
   407                           * after the data zone write pointer.
   408                           */
   409                          ret = dmz_reclaim_buf(zrc, dzone);
   410                          rzone = bzone;
   411                  } else {
   412                          /*
   413                           * Reclaim the data zone by merging it into the
   414                           * buffer zone so that the buffer zone itself can
   415                           * be later reclaimed.
   416                           */
   417                          ret = dmz_reclaim_seq_data(zrc, dzone);
   418                          rzone = dzone;
   419                  }
   420          }
   421  out:
   422          if (ret) {
   423                  if (ret == -EINTR)
   424                          DMDEBUG("(%s/%u): reclaim zone %u interrupted",
   425                                  dmz_metadata_label(zmd), zrc->dev_idx,
   426                                  rzone->id);
   427                  else
   428                          DMDEBUG("(%s/%u): Failed to reclaim zone %u, err %d",
   429                                  dmz_metadata_label(zmd), zrc->dev_idx,
   430                                  rzone->id, ret);
                                        ^^^^^^^^^
Dereference.

   431                  dmz_unlock_zone_reclaim(dzone);
   432                  return ret;
   433          }
   434  
   435          ret = dmz_flush_metadata(zrc->metadata);
   436          if (ret) {
   437                  DMDEBUG("(%s/%u): Metadata flush for zone %u failed, err %d",
   438                          dmz_metadata_label(zmd), zrc->dev_idx, rzone->id, ret);
   439                  return ret;
   440          }
   441  
   442          DMDEBUG("(%s/%u): Reclaimed zone %u in %u ms",
   443                  dmz_metadata_label(zmd), zrc->dev_idx,
   444                  rzone->id, jiffies_to_msecs(jiffies - start));
   445          return 0;
   446  }

regards,
dan carpenter

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

