Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5141DC2
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 09:30:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 695887FDE5;
	Wed, 12 Jun 2019 07:30:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A3B66843B;
	Wed, 12 Jun 2019 07:30:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57C751806B18;
	Wed, 12 Jun 2019 07:30:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BDBMV1017710 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 09:11:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D4A260C4E; Tue, 11 Jun 2019 13:11:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37D0260BF1;
	Tue, 11 Jun 2019 13:11:08 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A3B74EBC9;
	Tue, 11 Jun 2019 13:10:59 +0000 (UTC)
Date: Tue, 11 Jun 2019 09:10:58 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <1206355816.34396746.1560258658768.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190610192803.GA29002@redhat.com>
References: <20190610090730.8589-1-pagupta@redhat.com>
	<20190610090730.8589-5-pagupta@redhat.com>
	<20190610192803.GA29002@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.116.33, 10.4.195.27]
Thread-Topic: enable synchronous dax
Thread-Index: 9TyGIIOSkuHn9exFInDwoSOU8/oLjA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 12 Jun 2019 03:28:18 -0400
Cc: rdunlap@infradead.org, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
	jasowang@redhat.com, david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	adilger kernel <adilger.kernel@dilger.ca>, zwisler@kernel.org,
	aarcange@redhat.com, dave jiang <dave.jiang@intel.com>,
	jstaron@google.com, linux-nvdimm@lists.01.org,
	vishal l verma <vishal.l.verma@intel.com>, david@redhat.com,
	willy@infradead.org, hch@infradead.org,
	linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval shaia <yuval.shaia@oracle.com>,
	stefanha@redhat.com, imammedo@redhat.com,
	dan j williams <dan.j.williams@intel.com>,
	lcapitulino@redhat.com, kwolf@redhat.com, nilal@redhat.com,
	tytso@mit.edu, xiaoguangrong eric <xiaoguangrong.eric@gmail.com>,
	cohuck@redhat.com, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
	darrick wong <darrick.wong@oracle.com>
Subject: Re: [dm-devel] [Qemu-devel] [PATCH v11 4/7] dm: enable synchronous
	dax
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 12 Jun 2019 07:30:28 +0000 (UTC)

Hi Mike,

Thanks for the review Please find my reply inline.

> 
> dm_table_supports_dax() is called multiple times (from
> dm_table_set_restrictions and dm_table_determine_type).  It is strange
> to have a getter have a side-effect of being a setter too.  Overloading
> like this could get you in trouble in the future.
> 
> Are you certain this is what you want?

I agree with you.

> 
> Or would it be better to refactor dm_table_supports_dax() to take an
> iterate_devices_fn arg and have callers pass the appropriate function?
> Then have dm_table_set_restrictions() caller do:
> 
>      if (dm_table_supports_dax(t, device_synchronous, NULL))
>                set_dax_synchronous(t->md->dax_dev);
> 
> (NULL arg implies dm_table_supports_dax() refactoring would take a int
> *data pointer rather than int type).
> 
> Mike
> 

I am sending below patch as per your suggestion. Does it look
near to what you have in mind?

Thank you,
Pankaj

===============

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 350cf0451456..8d89acc8b8c2 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -881,7 +881,7 @@ void dm_table_set_type(struct dm_table *t, enum dm_queue_mode type)
 EXPORT_SYMBOL_GPL(dm_table_set_type);

 /* validate the dax capability of the target device span */
-static int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
+int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
                                       sector_t start, sector_t len, void *data)
 {
        int blocksize = *(int *) data;
@@ -890,7 +890,15 @@ static int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
                        start, len);
 }

-bool dm_table_supports_dax(struct dm_table *t, int blocksize)
+/* Check devices support synchronous DAX */
+static int device_synchronous(struct dm_target *ti, struct dm_dev *dev,
+                                      sector_t start, sector_t len, void *data)
+{
+       return dax_synchronous(dev->dax_dev);
+}
+
+bool dm_table_supports_dax(struct dm_table *t,
+                         iterate_devices_callout_fn iterate_fn, int *blocksize)
 {
        struct dm_target *ti;
        unsigned i;
@@ -903,8 +911,7 @@ bool dm_table_supports_dax(struct dm_table *t, int blocksize)
                        return false;

                if (!ti->type->iterate_devices ||
-                   !ti->type->iterate_devices(ti, device_supports_dax,
-                           &blocksize))
+                       !ti->type->iterate_devices(ti, iterate_fn, blocksize))
                        return false;
        }

@@ -940,6 +947,7 @@ static int dm_table_determine_type(struct dm_table *t)
        struct dm_target *tgt;
        struct list_head *devices = dm_table_get_devices(t);
        enum dm_queue_mode live_md_type = dm_get_md_type(t->md);
+       int page_size = PAGE_SIZE;

        if (t->type != DM_TYPE_NONE) {
                /* target already set the table's type */
@@ -984,7 +992,7 @@ static int dm_table_determine_type(struct dm_table *t)
 verify_bio_based:
                /* We must use this table as bio-based */
                t->type = DM_TYPE_BIO_BASED;
-               if (dm_table_supports_dax(t, PAGE_SIZE) ||
+               if (dm_table_supports_dax(t, device_supports_dax, &page_size) ||
                    (list_empty(devices) && live_md_type == DM_TYPE_DAX_BIO_BASED)) {
                        t->type = DM_TYPE_DAX_BIO_BASED;
                } else {
@@ -1883,6 +1891,7 @@ void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
                               struct queue_limits *limits)
 {
        bool wc = false, fua = false;
+       int page_size = PAGE_SIZE;

        /*
         * Copy table's limits to the DM device's request_queue
@@ -1910,8 +1919,13 @@ void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
        }
        blk_queue_write_cache(q, wc, fua);

-       if (dm_table_supports_dax(t, PAGE_SIZE))
+       if (dm_table_supports_dax(t, device_supports_dax, &page_size)) {
+
                blk_queue_flag_set(QUEUE_FLAG_DAX, q);
+               if (dm_table_supports_dax(t, device_synchronous, NULL))
+                       set_dax_synchronous(t->md->dax_dev);
+       }
        else
                blk_queue_flag_clear(QUEUE_FLAG_DAX, q);

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index b1caa7188209..b92c42a72ad4 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1119,7 +1119,7 @@ static bool dm_dax_supported(struct dax_device *dax_dev, struct block_device *bd
        if (!map)
                return false;

-       ret = dm_table_supports_dax(map, blocksize);
+       ret = dm_table_supports_dax(map, device_supports_dax, &blocksize);

        dm_put_live_table(md, srcu_idx);

diff --git a/drivers/md/dm.h b/drivers/md/dm.h
index 17e3db54404c..0475673337f3 100644
--- a/drivers/md/dm.h
+++ b/drivers/md/dm.h
@@ -72,7 +72,10 @@ bool dm_table_bio_based(struct dm_table *t);
 bool dm_table_request_based(struct dm_table *t);
 void dm_table_free_md_mempools(struct dm_table *t);
 struct dm_md_mempools *dm_table_get_md_mempools(struct dm_table *t);
-bool dm_table_supports_dax(struct dm_table *t, int blocksize);
+bool dm_table_supports_dax(struct dm_table *t, iterate_devices_callout_fn fn,
+                          int *blocksize);
+int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
+                          sector_t start, sector_t len, void *data);

 void dm_lock_md_type(struct mapped_device *md);
 void dm_unlock_md_type(struct mapped_device *md);
--
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
