Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EA78E3C67BD
	for <lists+dm-devel@lfdr.de>; Tue, 13 Jul 2021 02:56:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-xri_iCuTPl66F3Opqmgh8Q-1; Mon, 12 Jul 2021 20:56:15 -0400
X-MC-Unique: xri_iCuTPl66F3Opqmgh8Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4BBF804301;
	Tue, 13 Jul 2021 00:56:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C63C5C25D;
	Tue, 13 Jul 2021 00:56:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50EB94EA39;
	Tue, 13 Jul 2021 00:56:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16D0thoB025260 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Jul 2021 20:55:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 085F1B5503; Tue, 13 Jul 2021 00:55:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F4065C77CD
	for <dm-devel@redhat.com>; Tue, 13 Jul 2021 00:55:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A49E80D08E
	for <dm-devel@redhat.com>; Tue, 13 Jul 2021 00:55:41 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-441-ZW2fDgo2N9q72UrbNiz6Bw-1;
	Mon, 12 Jul 2021 20:55:39 -0400
X-MC-Unique: ZW2fDgo2N9q72UrbNiz6Bw-1
Received: from Lenovo-Legion-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id E9CCC20B83F8;
	Mon, 12 Jul 2021 17:49:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E9CCC20B83F8
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: dm-devel@redhat.com, agk@redhat.com, snitzer@redhat.com
Date: Mon, 12 Jul 2021 17:49:03 -0700
Message-Id: <20210713004904.8808-7-tusharsu@linux.microsoft.com>
In-Reply-To: <20210713004904.8808-1-tusharsu@linux.microsoft.com>
References: <20210713004904.8808-1-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16D0thoB025260
X-loop: dm-devel@redhat.com
Cc: tusharsu@linux.microsoft.com, nramas@linux.microsoft.com,
	linux-integrity@vger.kernel.org, zohar@linux.ibm.com
Subject: [dm-devel] [PATCH 6/7] dm: update target specific status functions
	to measure data
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For device mapper targets to take advantage of IMA's measurement
capabilities, the status functions for the individual targets need to be
updated to handle the status_type_t case for value STATUSTYPE_IMA.

Update status functions for the following target types, to log their
respective attributes to be measured using IMA.
 01. cache
 02. crypt
 03. integrity
 04. linear
 05. mirror
 06. multipath
 07. raid
 08. snapshot
 09. striped
 10. verity 

For rest of the targets, handle the STATUSTYPE_IMA case by setting the 
measurement buffer to NULL.

For IMA to measure the data on a given system, the IMA policy on the
system needs to be updated to have the following line, and the system 
needs to be restarted for the measurements to take effect.

/etc/ima/ima-policy
 measure func=CRITICAL_DATA label=device-mapper template=ima-buf

The measurements will be reflected in the IMA logs, which are located at:

/sys/kernel/security/integrity/ima/ascii_runtime_measurements
/sys/kernel/security/integrity/ima/binary_runtime_measurements

These IMA logs can later be consumed by various attestation clients
running on the system, and send them to external services for attesting
the system.

The DM target data measured by IMA subsystem can alternatively
be queried from userspace by setting DM_IMA_MEASUREMENT_FLAG with
DM_TABLE_STATUS_CMD.

Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
---
 drivers/md/dm-cache-target.c               | 24 ++++++++++++
 drivers/md/dm-clone-target.c               |  7 ++++
 drivers/md/dm-crypt.c                      | 29 ++++++++++++++
 drivers/md/dm-delay.c                      |  4 ++
 drivers/md/dm-dust.c                       |  4 ++
 drivers/md/dm-ebs-target.c                 |  3 ++
 drivers/md/dm-era-target.c                 |  4 ++
 drivers/md/dm-flakey.c                     |  4 ++
 drivers/md/dm-integrity.c                  | 24 ++++++++++++
 drivers/md/dm-linear.c                     |  8 ++++
 drivers/md/dm-log-userspace-base.c         |  3 ++
 drivers/md/dm-log-writes.c                 |  4 ++
 drivers/md/dm-log.c                        | 10 +++++
 drivers/md/dm-mpath.c                      | 29 ++++++++++++++
 drivers/md/dm-ps-historical-service-time.c |  3 ++
 drivers/md/dm-ps-io-affinity.c             |  3 ++
 drivers/md/dm-ps-queue-length.c            |  3 ++
 drivers/md/dm-ps-round-robin.c             |  4 ++
 drivers/md/dm-ps-service-time.c            |  3 ++
 drivers/md/dm-raid.c                       | 39 +++++++++++++++++++
 drivers/md/dm-raid1.c                      | 18 +++++++++
 drivers/md/dm-snap-persistent.c            |  4 ++
 drivers/md/dm-snap-transient.c             |  4 ++
 drivers/md/dm-snap.c                       | 13 +++++++
 drivers/md/dm-stripe.c                     | 16 ++++++++
 drivers/md/dm-switch.c                     |  4 ++
 drivers/md/dm-thin.c                       |  8 ++++
 drivers/md/dm-unstripe.c                   |  4 ++
 drivers/md/dm-verity-target.c              | 45 ++++++++++++++++++++++
 drivers/md/dm-writecache.c                 |  3 ++
 drivers/md/dm-zoned-target.c               |  3 ++
 include/linux/device-mapper.h              |  4 ++
 32 files changed, 338 insertions(+)

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 6ab01ff25747..f1299e481d9d 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -3192,6 +3192,30 @@ static void cache_status(struct dm_target *ti, status_type_t type,
 			DMEMIT(" %s", cache->ctr_args[i]);
 		if (cache->nr_ctr_args)
 			DMEMIT(" %s", cache->ctr_args[cache->nr_ctr_args - 1]);
+		break;
+
+	case STATUSTYPE_IMA:
+		DMEMIT_NAME_VERSION(ti->type);
+
+		if (get_cache_mode(cache) == CM_FAIL)
+			DMEMIT("metadata_mode=fail,");
+		else if (get_cache_mode(cache) == CM_READ_ONLY)
+			DMEMIT("metadata_mode=ro,");
+		else
+			DMEMIT("metadata_mode=rw,");
+
+		format_dev_t(buf, cache->metadata_dev->bdev->bd_dev);
+		DMEMIT("cache_metadata_device=%s,", buf);
+		format_dev_t(buf, cache->cache_dev->bdev->bd_dev);
+		DMEMIT("cache_device=%s,", buf);
+		format_dev_t(buf, cache->origin_dev->bdev->bd_dev);
+		DMEMIT("cache_origin_device=%s,", buf);
+		DMEMIT("writethrough=%c,", writethrough_mode(cache) ? 'y' : 'n');
+		DMEMIT("writeback=%c,", writeback_mode(cache) ? 'y' : 'n');
+		DMEMIT("passthrough=%c,", passthrough_mode(cache) ? 'y' : 'n');
+		DMEMIT("metadata2=%c,", cache->features.metadata_version == 2 ? 'y' : 'n');
+		DMEMIT("no_discard_passdown=%c;", cache->features.discard_passdown ? 'n' : 'y');
+		break;
 	}
 
 	return;
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index a90bdf9b2ca6..506d4d70b8b9 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -1499,6 +1499,13 @@ static void clone_status(struct dm_target *ti, status_type_t type,
 
 		for (i = 0; i < clone->nr_ctr_args; i++)
 			DMEMIT(" %s", clone->ctr_args[i]);
+
+		break;
+
+	case STATUSTYPE_IMA:
+		*result = '\0';
+
+		break;
 	}
 
 	return;
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index b0ab080f2567..b7b72f31a7c6 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -3473,6 +3473,35 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
 				DMEMIT(" iv_large_sectors");
 		}
 
+		break;
+
+	case STATUSTYPE_IMA:
+		DMEMIT_NAME_VERSION(ti->type);
+
+		DMEMIT("allow_discards=%c,", ti->num_discard_bios ? 'y' : 'n');
+		DMEMIT("same_cpu=%c,", test_bit(DM_CRYPT_SAME_CPU, &cc->flags) ? 'y' : 'n');
+		DMEMIT("submit_from_crypt_cpus=%c,", test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags) ?
+		       'y' : 'n');
+		DMEMIT("no_read_workqueue=%c,", test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags) ?
+		       'y' : 'n');
+		DMEMIT("no_write_workqueue=%c,", test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags) ?
+		       'y' : 'n');
+		DMEMIT("iv_large_sectors=%c", test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags) ?
+		       'y' : 'n');
+
+		if (cc->on_disk_tag_size)
+			DMEMIT(",integrity_tag_size=%u,cipher_auth=%s",
+				cc->on_disk_tag_size, cc->cipher_auth);
+		if (cc->sector_size != (1 << SECTOR_SHIFT))
+			DMEMIT(",sector_size=%d", cc->sector_size);
+		if (cc->cipher_string)
+			DMEMIT(",cipher_string=%s", cc->cipher_string);
+
+		DMEMIT(",key_size=%u", cc->key_size);
+		DMEMIT(",key_parts=%u", cc->key_parts);
+		DMEMIT(",key_extra_size=%u", cc->key_extra_size);
+		DMEMIT(",key_mac_size=%u;", cc->key_mac_size);
+
 		break;
 	}
 }
diff --git a/drivers/md/dm-delay.c b/drivers/md/dm-delay.c
index 2628a832787b..59e51d285b0e 100644
--- a/drivers/md/dm-delay.c
+++ b/drivers/md/dm-delay.c
@@ -326,6 +326,10 @@ static void delay_status(struct dm_target *ti, status_type_t type,
 			DMEMIT_DELAY_CLASS(&dc->flush);
 		}
 		break;
+
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index cbe1058ee589..3163e2b1418e 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -527,6 +527,10 @@ static void dust_status(struct dm_target *ti, status_type_t type,
 		DMEMIT("%s %llu %u", dd->dev->name,
 		       (unsigned long long)dd->start, dd->blksz);
 		break;
+
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
index 71475a2410be..ec8426611cc6 100644
--- a/drivers/md/dm-ebs-target.c
+++ b/drivers/md/dm-ebs-target.c
@@ -401,6 +401,9 @@ static void ebs_status(struct dm_target *ti, status_type_t type,
 		snprintf(result, maxlen, ec->u_bs_set ? "%s %llu %u %u" : "%s %llu %u",
 			 ec->dev->name, (unsigned long long) ec->start, ec->e_bs, ec->u_bs);
 		break;
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-era-target.c b/drivers/md/dm-era-target.c
index d9ac7372108c..08beb311e2e0 100644
--- a/drivers/md/dm-era-target.c
+++ b/drivers/md/dm-era-target.c
@@ -1640,6 +1640,10 @@ static void era_status(struct dm_target *ti, status_type_t type,
 		format_dev_t(buf, era->origin_dev->bdev->bd_dev);
 		DMEMIT("%s %u", buf, era->sectors_per_block);
 		break;
+
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 
 	return;
diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
index b7fee9936f05..8720e1a4873b 100644
--- a/drivers/md/dm-flakey.c
+++ b/drivers/md/dm-flakey.c
@@ -440,6 +440,10 @@ static void flakey_status(struct dm_target *ti, status_type_t type,
 			       fc->corrupt_bio_value, fc->corrupt_bio_flags);
 
 		break;
+
+	case STATUSTYPE_IMA:
+		result[0] = '\0';
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 20f2510db1f6..59f5618143fc 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -3306,6 +3306,30 @@ static void dm_integrity_status(struct dm_target *ti, status_type_t type,
 		EMIT_ALG(journal_mac_alg, "journal_mac");
 		break;
 	}
+	case STATUSTYPE_IMA:
+		DMEMIT_NAME_VERSION(ti->type);
+		DMEMIT("dev_name=%s,start=%llu,tag_size=%u,mode=%c",
+			ic->dev->name, ic->start, ic->tag_size, ic->mode);
+
+		if (ic->meta_dev)
+			DMEMIT(",meta_device=%s", ic->meta_dev->name);
+		if (ic->sectors_per_block != 1)
+			DMEMIT(",block_size=%u", ic->sectors_per_block << SECTOR_SHIFT);
+
+		DMEMIT(",recalculate=%c", (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)) ?
+		       'y' : 'n');
+		DMEMIT(",allow_discards=%c", ic->discard ? 'y' : 'n');
+		DMEMIT(",fix_padding=%c",
+		       ((ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_PADDING)) != 0) ? 'y' : 'n');
+		DMEMIT(",fix_hmac=%c",
+		       ((ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_HMAC)) != 0) ? 'y' : 'n');
+		DMEMIT(",legacy_recalculate=%c", ic->legacy_recalculate ? 'y' : 'n');
+
+		DMEMIT(",journal_sectors=%u", ic->initial_sectors - SB_SECTORS);
+		DMEMIT(",interleave_sectors=%u", 1U << ic->sb->log2_interleave_sectors);
+		DMEMIT(",buffer_sectors=%u", 1U << ic->log2_buffer_sectors);
+		DMEMIT(",mode=%c;", ic->mode);
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 92db0f5e7f28..3c35370f33e1 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -106,6 +106,7 @@ static void linear_status(struct dm_target *ti, status_type_t type,
 			  unsigned status_flags, char *result, unsigned maxlen)
 {
 	struct linear_c *lc = (struct linear_c *) ti->private;
+	size_t sz = 0;
 
 	switch (type) {
 	case STATUSTYPE_INFO:
@@ -116,6 +117,13 @@ static void linear_status(struct dm_target *ti, status_type_t type,
 		snprintf(result, maxlen, "%s %llu", lc->dev->name,
 				(unsigned long long)lc->start);
 		break;
+
+	case STATUSTYPE_IMA:
+		DMEMIT_NAME_VERSION(ti->type);
+
+		DMEMIT("device_name=%s,start=%llu;", lc->dev->name,
+		       (unsigned long long)lc->start);
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-log-userspace-base.c b/drivers/md/dm-log-userspace-base.c
index 52090bee17c2..9ab93ebea889 100644
--- a/drivers/md/dm-log-userspace-base.c
+++ b/drivers/md/dm-log-userspace-base.c
@@ -820,6 +820,9 @@ static int userspace_status(struct dm_dirty_log *log, status_type_t status_type,
 			DMEMIT("integrated_flush ");
 		DMEMIT("%s ", table_args);
 		break;
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 	return (r) ? 0 : (int)sz;
 }
diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index 57882654ffee..d93a4db23512 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -834,6 +834,10 @@ static void log_writes_status(struct dm_target *ti, status_type_t type,
 	case STATUSTYPE_TABLE:
 		DMEMIT("%s %s", lc->dev->name, lc->logdev->name);
 		break;
+
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-log.c b/drivers/md/dm-log.c
index 33e71ea6cc14..1ecf75ef276a 100644
--- a/drivers/md/dm-log.c
+++ b/drivers/md/dm-log.c
@@ -793,6 +793,11 @@ static int core_status(struct dm_dirty_log *log, status_type_t status,
 		DMEMIT("%s %u %u ", log->type->name,
 		       lc->sync == DEFAULTSYNC ? 1 : 2, lc->region_size);
 		DMEMIT_SYNC;
+		break;
+
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 
 	return sz;
@@ -817,6 +822,11 @@ static int disk_status(struct dm_dirty_log *log, status_type_t status,
 		       lc->sync == DEFAULTSYNC ? 2 : 3, lc->log_dev->name,
 		       lc->region_size);
 		DMEMIT_SYNC;
+		break;
+
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 
 	return sz;
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index bced42f082b0..408638395d9b 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -1904,6 +1904,35 @@ static void multipath_status(struct dm_target *ti, status_type_t type,
 			}
 		}
 		break;
+
+	case STATUSTYPE_IMA:
+		DMEMIT_NAME_VERSION(ti->type);
+
+		list_for_each_entry(pg, &m->priority_groups, list) {
+			if (pg->bypassed)
+				state = 'D';	/* Disabled */
+			else if (pg == m->current_pg)
+				state = 'A';	/* Currently Active */
+			else
+				state = 'E';	/* Enabled */
+
+			DMEMIT("state=%c", state);
+
+			list_for_each_entry(p, &pg->pgpaths, list) {
+				DMEMIT(",path_name=%s,is_active=%c,fail_count=%u",
+					p->path.dev->name,
+					p->is_active ? 'A' : 'F',
+					p->fail_count);
+				if (pg->ps.type->status) {
+					DMEMIT(",path_selector_status=");
+					sz += pg->ps.type->status(&pg->ps,
+					      &p->path, type, result + sz,
+					      maxlen - sz);
+				}
+			}
+			DMEMIT(";");
+		}
+		break;
 	}
 
 	spin_unlock_irqrestore(&m->lock, flags);
diff --git a/drivers/md/dm-ps-historical-service-time.c b/drivers/md/dm-ps-historical-service-time.c
index 186f91e2752c..1856a1b125cc 100644
--- a/drivers/md/dm-ps-historical-service-time.c
+++ b/drivers/md/dm-ps-historical-service-time.c
@@ -255,6 +255,9 @@ static int hst_status(struct path_selector *ps, struct dm_path *path,
 		case STATUSTYPE_TABLE:
 			DMEMIT("0 ");
 			break;
+		case STATUSTYPE_IMA:
+			*result = '\0';
+			break;
 		}
 	}
 
diff --git a/drivers/md/dm-ps-io-affinity.c b/drivers/md/dm-ps-io-affinity.c
index 077655cd4fae..8eaa7b726387 100644
--- a/drivers/md/dm-ps-io-affinity.c
+++ b/drivers/md/dm-ps-io-affinity.c
@@ -171,6 +171,9 @@ static int ioa_status(struct path_selector *ps, struct dm_path *path,
 		pi = path->pscontext;
 		DMEMIT("%*pb ", cpumask_pr_args(pi->cpumask));
 		break;
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 
 	return sz;
diff --git a/drivers/md/dm-ps-queue-length.c b/drivers/md/dm-ps-queue-length.c
index 5fd018d18418..cef70657bbbc 100644
--- a/drivers/md/dm-ps-queue-length.c
+++ b/drivers/md/dm-ps-queue-length.c
@@ -102,6 +102,9 @@ static int ql_status(struct path_selector *ps, struct dm_path *path,
 		case STATUSTYPE_TABLE:
 			DMEMIT("%u ", pi->repeat_count);
 			break;
+		case STATUSTYPE_IMA:
+			*result = '\0';
+			break;
 		}
 	}
 
diff --git a/drivers/md/dm-ps-round-robin.c b/drivers/md/dm-ps-round-robin.c
index bdbb7e6e8212..27f44c5fa04e 100644
--- a/drivers/md/dm-ps-round-robin.c
+++ b/drivers/md/dm-ps-round-robin.c
@@ -100,6 +100,10 @@ static int rr_status(struct path_selector *ps, struct dm_path *path,
 			pi = path->pscontext;
 			DMEMIT("%u ", pi->repeat_count);
 			break;
+
+		case STATUSTYPE_IMA:
+			*result = '\0';
+			break;
 		}
 	}
 
diff --git a/drivers/md/dm-ps-service-time.c b/drivers/md/dm-ps-service-time.c
index 9cfda665e9eb..3ec9c33265c5 100644
--- a/drivers/md/dm-ps-service-time.c
+++ b/drivers/md/dm-ps-service-time.c
@@ -99,6 +99,9 @@ static int st_status(struct path_selector *ps, struct dm_path *path,
 			DMEMIT("%u %u ", pi->repeat_count,
 			       pi->relative_throughput);
 			break;
+		case STATUSTYPE_IMA:
+			result[0] = '\0';
+			break;
 		}
 	}
 
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index bf4a467fc73a..71fffafe3afa 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -3671,6 +3671,45 @@ static void raid_status(struct dm_target *ti, status_type_t type,
 		for (i = 0; i < rs->raid_disks; i++)
 			DMEMIT(" %s %s", __get_dev_name(rs->dev[i].meta_dev),
 					 __get_dev_name(rs->dev[i].data_dev));
+		break;
+
+	case STATUSTYPE_IMA:
+		rt = get_raid_type_by_ll(mddev->new_level, mddev->new_layout);
+		if (!rt)
+			return;
+
+		DMEMIT_NAME_VERSION(ti->type);
+
+		DMEMIT("raid_type=%s,raid_disks=%d,", rt->name, mddev->raid_disks);
+
+		/* Access most recent mddev properties for status output */
+		smp_rmb();
+		state = decipher_sync_action(mddev, recovery);
+		DMEMIT("raid_state=%s", sync_str(state));
+
+		for (i = 0; i < rs->raid_disks; i++) {
+			DMEMIT(",raid_device_%d_status=", i);
+			DMEMIT(__raid_dev_status(rs, &rs->dev[i].rdev));
+		}
+
+		if (rt_is_raid456(rt)) {
+			DMEMIT(",journal_dev_mode=");
+			switch (rs->journal_dev.mode) {
+			case R5C_JOURNAL_MODE_WRITE_THROUGH:
+				DMEMIT("%s",
+				       _raid456_journal_mode[R5C_JOURNAL_MODE_WRITE_THROUGH].param);
+				break;
+			case R5C_JOURNAL_MODE_WRITE_BACK:
+				DMEMIT("%s",
+				       _raid456_journal_mode[R5C_JOURNAL_MODE_WRITE_BACK].param);
+				break;
+			default:
+				DMEMIT("invalid");
+				break;
+			}
+		}
+		DMEMIT(";");
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index b0a82f29a2e4..4d042c2abf88 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -1435,6 +1435,24 @@ static void mirror_status(struct dm_target *ti, status_type_t type,
 		}
 
 		break;
+
+	case STATUSTYPE_IMA:
+		DMEMIT_NAME_VERSION(ti->type);
+
+		DMEMIT("mirrors=%d,", ms->nr_mirrors);
+		for (m = 0; m < ms->nr_mirrors; m++) {
+			DMEMIT("mirror_device_%d=%s,", m, ms->mirror[m].dev->name);
+			DMEMIT("mirror_device_%d_status=%c,",
+			       m, device_status_char(&(ms->mirror[m])));
+		}
+
+		DMEMIT("handle_errors=%c,", errors_handled(ms) ? 'y' : 'n');
+		DMEMIT("keep_log=%c,", keep_log(ms) ? 'y' : 'n');
+
+		DMEMIT("log_type_status=");
+		sz += log->type->status(log, type, result+sz, maxlen-sz);
+		DMEMIT(";");
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-snap-persistent.c b/drivers/md/dm-snap-persistent.c
index 9ab4bf651ca9..3bb5cff5d6fc 100644
--- a/drivers/md/dm-snap-persistent.c
+++ b/drivers/md/dm-snap-persistent.c
@@ -908,6 +908,10 @@ static unsigned persistent_status(struct dm_exception_store *store,
 	case STATUSTYPE_TABLE:
 		DMEMIT(" %s %llu", store->userspace_supports_overflow ? "PO" : "P",
 		       (unsigned long long)store->chunk_size);
+		break;
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 
 	return sz;
diff --git a/drivers/md/dm-snap-transient.c b/drivers/md/dm-snap-transient.c
index 4d50a12cf00c..0e0ae4c36b37 100644
--- a/drivers/md/dm-snap-transient.c
+++ b/drivers/md/dm-snap-transient.c
@@ -95,6 +95,10 @@ static unsigned transient_status(struct dm_exception_store *store,
 		break;
 	case STATUSTYPE_TABLE:
 		DMEMIT(" N %llu", (unsigned long long)store->chunk_size);
+		break;
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 
 	return sz;
diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 751ec5ea1dbb..a407dbba0b5a 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -2390,6 +2390,16 @@ static void snapshot_status(struct dm_target *ti, status_type_t type,
 				DMEMIT(" discard_passdown_origin");
 		}
 		break;
+
+	case STATUSTYPE_IMA:
+		DMEMIT_NAME_VERSION(ti->type);
+		DMEMIT("snap_origin_name=%s,", snap->origin->name);
+		DMEMIT("snap_cow_name=%s,", snap->cow->name);
+		DMEMIT("snap_valid=%c,", snap->valid ? 'y' : 'n');
+		DMEMIT("snap_merge_failed=%c,", snap->merge_failed ? 'y' : 'n');
+		DMEMIT("snapshot_overflowed=%c;", snap->snapshot_overflowed ? 'y' : 'n');
+		break;
+
 	}
 }
 
@@ -2734,6 +2744,9 @@ static void origin_status(struct dm_target *ti, status_type_t type,
 	case STATUSTYPE_TABLE:
 		snprintf(result, maxlen, "%s", o->dev->name);
 		break;
+	case STATUSTYPE_IMA:
+		result[0] = '\0';
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index df359d33cda8..82f3593f6a0e 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -428,6 +428,22 @@ static void stripe_status(struct dm_target *ti, status_type_t type,
 			DMEMIT(" %s %llu", sc->stripe[i].dev->name,
 			    (unsigned long long)sc->stripe[i].physical_start);
 		break;
+
+	case STATUSTYPE_IMA:
+		DMEMIT_NAME_VERSION(ti->type);
+
+		DMEMIT("stripes=%d,chunk_size=%llu", sc->stripes,
+		       (unsigned long long)sc->chunk_size);
+
+		for (i = 0; i < sc->stripes; i++) {
+			DMEMIT(",stripe_%d_device_name=%s", i, sc->stripe[i].dev->name);
+			DMEMIT(",stripe_%d_physical_start=%llu", i,
+			       (unsigned long long)sc->stripe[i].physical_start);
+			DMEMIT(",stripe_%d_status=%c", i,
+			       atomic_read(&(sc->stripe[i].error_count)) ? 'D' : 'A');
+		}
+		DMEMIT(";");
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-switch.c b/drivers/md/dm-switch.c
index 262e2b0fd975..028a92ff6d57 100644
--- a/drivers/md/dm-switch.c
+++ b/drivers/md/dm-switch.c
@@ -504,6 +504,10 @@ static void switch_status(struct dm_target *ti, status_type_t type,
 			DMEMIT(" %s %llu", sctx->path_list[path_nr].dmdev->name,
 			       (unsigned long long)sctx->path_list[path_nr].start);
 		break;
+
+	case STATUSTYPE_IMA:
+		result[0] = '\0';
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 985baee3a678..4c67b77c23c1 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -4012,6 +4012,10 @@ static void pool_status(struct dm_target *ti, status_type_t type,
 		       (unsigned long long)pt->low_water_blocks);
 		emit_flags(&pt->requested_pf, result, sz, maxlen);
 		break;
+
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 	return;
 
@@ -4423,6 +4427,10 @@ static void thin_status(struct dm_target *ti, status_type_t type,
 			if (tc->origin_dev)
 				DMEMIT(" %s", format_dev_t(buf, tc->origin_dev->bdev->bd_dev));
 			break;
+
+		case STATUSTYPE_IMA:
+			*result = '\0';
+			break;
 		}
 	}
 
diff --git a/drivers/md/dm-unstripe.c b/drivers/md/dm-unstripe.c
index 7357c1bd5863..fdc8921e5c19 100644
--- a/drivers/md/dm-unstripe.c
+++ b/drivers/md/dm-unstripe.c
@@ -156,6 +156,10 @@ static void unstripe_status(struct dm_target *ti, status_type_t type,
 		       uc->stripes, (unsigned long long)uc->chunk_size, uc->unstripe,
 		       uc->dev->name, (unsigned long long)uc->physical_start);
 		break;
+
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index d3e76aefc1a6..0cae12944352 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -772,6 +772,51 @@ static void verity_status(struct dm_target *ti, status_type_t type,
 			DMEMIT(" " DM_VERITY_ROOT_HASH_VERIFICATION_OPT_SIG_KEY
 				" %s", v->signature_key_desc);
 		break;
+
+	case STATUSTYPE_IMA:
+		DMEMIT_NAME_VERSION(ti->type);
+
+		DMEMIT("hash_failed=%c,", v->hash_failed ? 'C' : 'V');
+
+		DMEMIT("verity_version=%u,", v->version);
+		DMEMIT("data_device_name=%s,", v->data_dev->name);
+		DMEMIT("hash_device_name=%s,", v->hash_dev->name);
+		DMEMIT("verity_algorithm=%s,", v->alg_name);
+
+		DMEMIT("root_digest=");
+		for (x = 0; x < v->digest_size; x++)
+			DMEMIT("%02x", v->root_digest[x]);
+		DMEMIT(",");
+
+		DMEMIT("salt=");
+		if (!v->salt_size)
+			DMEMIT("-");
+		else
+			for (x = 0; x < v->salt_size; x++)
+				DMEMIT("%02x", v->salt[x]);
+		DMEMIT(",");
+
+		DMEMIT("ignore_zero_blocks=%c,", v->zero_digest ? 'y' : 'n');
+		DMEMIT("check_at_most_once=%c", v->validated_blocks ? 'y' : 'n');
+
+		if (v->mode != DM_VERITY_MODE_EIO) {
+			DMEMIT(",verity_mode=");
+			switch (v->mode) {
+			case DM_VERITY_MODE_LOGGING:
+				DMEMIT(DM_VERITY_OPT_LOGGING);
+				break;
+			case DM_VERITY_MODE_RESTART:
+				DMEMIT(DM_VERITY_OPT_RESTART);
+				break;
+			case DM_VERITY_MODE_PANIC:
+				DMEMIT(DM_VERITY_OPT_PANIC);
+				break;
+			default:
+				DMEMIT("invalid");
+			}
+		}
+		DMEMIT(";");
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index aecc246ade26..a7516bd7cd04 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -2536,6 +2536,9 @@ static void writecache_status(struct dm_target *ti, status_type_t type,
 		if (wc->writeback_fua_set)
 			DMEMIT(" %sfua", wc->writeback_fua ? "" : "no");
 		break;
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 }
 
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 7e88df64d197..ae1bc48c0043 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -1119,6 +1119,9 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 			DMEMIT(" %s", buf);
 		}
 		break;
+	case STATUSTYPE_IMA:
+		*result = '\0';
+		break;
 	}
 	return;
 }
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 738a7d023650..d4cd9ef94063 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -596,6 +596,10 @@ void dm_destroy_keyslot_manager(struct blk_keyslot_manager *ksm);
 #define DMEMIT(x...) sz += ((sz >= maxlen) ? \
 			  0 : scnprintf(result + sz, maxlen - sz, x))
 
+#define DMEMIT_NAME_VERSION(y) \
+		DMEMIT("target_type_name=%s,target_type_version=%u.%u.%u,", \
+		       (y)->name, (y)->version[0], (y)->version[1], (y)->version[2])
+
 /*
  * Definitions of return values from target end_io function.
  */
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

