Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B6D22FB012
	for <lists+dm-devel@lfdr.de>; Wed, 13 Nov 2019 12:57:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573646253;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EWWYrdxwTryjjO/lvWGPMNPRjSOkp8Zziiz/3Ca68kQ=;
	b=bMRhvzjWSNFcF03q5nqBH/6LvMwDkeAgj6wV1TjxUeppLfToj3LE7ExKGiG2aHxJEU188X
	w8BQww2spT9nWs5jJu+mK4lBVCjluMmkwYWoqZonFyqkdsgfQ4sROBksOqlUhLukoYbTht
	LwXSgjO1sj0f1IuDW4qgBZfupKiwwGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-iZMtNY5dMOG40HBLM7ftUw-1; Wed, 13 Nov 2019 06:57:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79B7518B5FA1;
	Wed, 13 Nov 2019 11:57:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A598F5DE7A;
	Wed, 13 Nov 2019 11:57:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1A011808878;
	Wed, 13 Nov 2019 11:57:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADBvGgP002454 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 06:57:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 664CA5DF2B; Wed, 13 Nov 2019 11:57:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 122045DE7A;
	Wed, 13 Nov 2019 11:57:13 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xADBvCwo026045; Wed, 13 Nov 2019 06:57:12 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xADBvCuj026042; Wed, 13 Nov 2019 06:57:12 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 13 Nov 2019 06:57:12 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Milan Broz <mbroz@redhat.com>, Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.1911130648210.20335@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-crypt@saout.de, dm-devel@redhat.com
Subject: [dm-devel] [PATCH] cryptsetup: add support for the "fix_padding"
	option
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: iZMtNY5dMOG40HBLM7ftUw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

This patch adds support for fixed padding to cryptsetup.

* Cryptsetup will accept superblocks version 4.
* If the dm-integrity target version is greater than 1.4, cryptsetup will=
=20
  add a flag "fix_padding" to the dm-integrity target arguments.

There is still one quirk: if we have an old libdm without=20
DM_DEVICE_GET_TARGET_VERSION and if dm-integrity module is not loaded,=20
cryptsetup will not detect that it can use the "fix_padding" option.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 lib/integrity/integrity.c |    7 +++----
 lib/integrity/integrity.h |    2 ++
 lib/libdevmapper.c        |   20 +++++++++++++++++++-
 lib/utils_dm.h            |    6 +++++-
 4 files changed, 29 insertions(+), 6 deletions(-)

Index: cryptsetup/lib/integrity/integrity.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- cryptsetup.orig/lib/integrity/integrity.c=092019-11-12 20:09:30.0000000=
00 +0100
+++ cryptsetup/lib/integrity/integrity.c=092019-11-12 21:09:05.000000000 +0=
100
@@ -41,8 +41,7 @@ static int INTEGRITY_read_superblock(str
 =09if (read_lseek_blockwise(devfd, device_block_size(cd, device),
 =09=09device_alignment(device), sb, sizeof(*sb), offset) !=3D sizeof(*sb) =
||
 =09    memcmp(sb->magic, SB_MAGIC, sizeof(sb->magic)) ||
-=09    (sb->version !=3D SB_VERSION_1 && sb->version !=3D SB_VERSION_2 &&
-=09     sb->version !=3D SB_VERSION_3)) {
+=09    sb->version < SB_VERSION_1 || sb->version > SB_VERSION_4) {
 =09=09log_std(cd, "No integrity superblock detected on %s.\n",
 =09=09=09device_path(device));
 =09=09r =3D -EINVAL;
@@ -203,7 +202,7 @@ int INTEGRITY_create_dmd_device(struct c
 =09if (r < 0)
 =09=09return r;
=20
-=09return dm_integrity_target_set(&dmd->segment, 0, dmd->size,
+=09return dm_integrity_target_set(cd, &dmd->segment, 0, dmd->size,
 =09=09=09crypt_metadata_device(cd), crypt_data_device(cd),
 =09=09=09crypt_get_integrity_tag_size(cd), crypt_get_data_offset(cd),
 =09=09=09crypt_get_sector_size(cd), vk, journal_crypt_key,
@@ -289,7 +288,7 @@ int INTEGRITY_format(struct crypt_device
 =09if (params && params->integrity_key_size)
 =09=09vk =3D crypt_alloc_volume_key(params->integrity_key_size, NULL);
=20
-=09r =3D dm_integrity_target_set(tgt, 0, dmdi.size, crypt_metadata_device(=
cd),
+=09r =3D dm_integrity_target_set(cd, tgt, 0, dmdi.size, crypt_metadata_dev=
ice(cd),
 =09=09=09crypt_data_device(cd), crypt_get_integrity_tag_size(cd),
 =09=09=09crypt_get_data_offset(cd), crypt_get_sector_size(cd), vk,
 =09=09=09journal_crypt_key, journal_mac_key, params);
Index: cryptsetup/lib/integrity/integrity.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- cryptsetup.orig/lib/integrity/integrity.h=092019-11-12 20:09:30.0000000=
00 +0100
+++ cryptsetup/lib/integrity/integrity.h=092019-11-12 20:12:54.000000000 +0=
100
@@ -34,10 +34,12 @@ struct crypt_dm_active_device;
 #define SB_VERSION_1=091
 #define SB_VERSION_2=092
 #define SB_VERSION_3=093
+#define SB_VERSION_4=094
=20
 #define SB_FLAG_HAVE_JOURNAL_MAC=09(1 << 0)
 #define SB_FLAG_RECALCULATING=09=09(1 << 1) /* V2 only */
 #define SB_FLAG_DIRTY_BITMAP=09=09(1 << 2) /* V3 only */
+#define SB_FLAG_FIXED_PADDING=09=09(1 << 3) /* V4 only */
=20
 struct superblock {
 =09uint8_t magic[8];
Index: cryptsetup/lib/libdevmapper.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- cryptsetup.orig/lib/libdevmapper.c=092019-11-12 20:09:30.000000000 +010=
0
+++ cryptsetup/lib/libdevmapper.c=092019-11-13 12:42:39.000000000 +0100
@@ -218,6 +218,9 @@ static void _dm_set_integrity_compat(str
 =09if (_dm_satisfies_version(1, 3, 0, integrity_maj, integrity_min, integr=
ity_patch))
 =09=09_dm_flags |=3D DM_INTEGRITY_BITMAP_SUPPORTED;
=20
+=09if (_dm_satisfies_version(1, 4, 0, integrity_maj, integrity_min, integr=
ity_patch))
+=09=09_dm_flags |=3D DM_INTEGRITY_FIX_PADDING_SUPPORTED;
+
 =09_dm_integrity_checked =3D true;
 }
=20
@@ -866,6 +869,11 @@ static char *get_dm_integrity_params(con
 =09=09strncat(features, feature, sizeof(features) - strlen(features) - 1);
 =09=09crypt_safe_free(hexkey);
 =09}
+=09if (tgt->u.integrity.fix_padding) {
+=09=09num_options++;
+=09=09snprintf(feature, sizeof(feature), "fix_padding ");
+=09=09strncat(features, feature, sizeof(features) - strlen(features) - 1);
+=09}
=20
 =09if (flags & CRYPT_ACTIVATE_RECALCULATE) {
 =09=09num_options++;
@@ -2334,6 +2342,8 @@ static int _dm_target_query_integrity(st
 =09=09=09=09}
 =09=09=09} else if (!strcmp(arg, "recalculate")) {
 =09=09=09=09*act_flags |=3D CRYPT_ACTIVATE_RECALCULATE;
+=09=09=09} else if (!strcmp(arg, "fix_padding")) {
+=09=09=09=09tgt->u.integrity.fix_padding =3D true;
 =09=09=09} else /* unknown option */
 =09=09=09=09goto err;
 =09=09}
@@ -2865,16 +2875,21 @@ int dm_verity_target_set(struct dm_targe
 =09return 0;
 }
=20
-int dm_integrity_target_set(struct dm_target *tgt, uint64_t seg_offset, ui=
nt64_t seg_size,
+int dm_integrity_target_set(struct crypt_device *cd,
+=09=09=09struct dm_target *tgt, uint64_t seg_offset, uint64_t seg_size,
 =09=09=09struct device *meta_device,
 =09=09        struct device *data_device, uint64_t tag_size, uint64_t offs=
et,
 =09=09=09uint32_t sector_size, struct volume_key *vk,
 =09=09=09struct volume_key *journal_crypt_key, struct volume_key *journal_=
mac_key,
 =09=09=09const struct crypt_params_integrity *ip)
 {
+=09uint32_t dmi_flags;
+
 =09if (!data_device)
 =09=09return -EINVAL;
=20
+=09_dm_check_versions(cd, DM_INTEGRITY);
+
 =09tgt->type =3D DM_INTEGRITY;
 =09tgt->direction =3D TARGET_SET;
 =09tgt->offset =3D seg_offset;
@@ -2890,6 +2905,9 @@ int dm_integrity_target_set(struct dm_ta
 =09tgt->u.integrity.journal_crypt_key =3D journal_crypt_key;
 =09tgt->u.integrity.journal_integrity_key =3D journal_mac_key;
=20
+=09if (!dm_flags(cd, DM_INTEGRITY, &dmi_flags) && dmi_flags & DM_INTEGRITY=
_FIX_PADDING_SUPPORTED)
+=09=09tgt->u.integrity.fix_padding =3D true;
+
 =09if (ip) {
 =09=09tgt->u.integrity.journal_size =3D ip->journal_size;
 =09=09tgt->u.integrity.journal_watermark =3D ip->journal_watermark;
Index: cryptsetup/lib/utils_dm.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- cryptsetup.orig/lib/utils_dm.h=092019-11-12 20:09:30.000000000 +0100
+++ cryptsetup/lib/utils_dm.h=092019-11-12 21:09:25.000000000 +0100
@@ -64,6 +64,7 @@ static inline uint32_t act2dmflags(uint3
 #define DM_INTEGRITY_RECALC_SUPPORTED (1 << 16) /* dm-integrity automatic =
recalculation supported */
 #define DM_INTEGRITY_BITMAP_SUPPORTED (1 << 17) /* dm-integrity bitmap mod=
e supported */
 #define DM_GET_TARGET_VERSION_SUPPORTED (1 << 18) /* dm DM_GET_TARGET vers=
ion ioctl supported */
+#define DM_INTEGRITY_FIX_PADDING_SUPPORTED (1 << 19) /* supports the param=
eter fix_padding that fixes a bug that caused excessive padding */
=20
 typedef enum { DM_CRYPT =3D 0, DM_VERITY, DM_INTEGRITY, DM_LINEAR, DM_ERRO=
R, DM_UNKNOWN } dm_target_type;
 enum tdirection { TARGET_SET =3D 1, TARGET_QUERY };
@@ -138,6 +139,8 @@ struct dm_target {
 =09=09struct volume_key *journal_crypt_key;
=20
 =09=09struct device *meta_device;
+
+=09=09bool fix_padding;
 =09} integrity;
 =09struct {
 =09=09uint64_t offset;
@@ -177,7 +180,8 @@ int dm_verity_target_set(struct dm_targe
 =09struct device *data_device, struct device *hash_device, struct device *=
fec_device,
 =09const char *root_hash, uint32_t root_hash_size, uint64_t hash_offset_bl=
ock,
 =09uint64_t hash_blocks, struct crypt_params_verity *vp);
-int dm_integrity_target_set(struct dm_target *tgt, uint64_t seg_offset, ui=
nt64_t seg_size,
+int dm_integrity_target_set(struct crypt_device *cd,
+=09struct dm_target *tgt, uint64_t seg_offset, uint64_t seg_size,
 =09struct device *meta_device,
 =09struct device *data_device, uint64_t tag_size, uint64_t offset, uint32_=
t sector_size,
 =09struct volume_key *vk,

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

