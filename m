Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 613AF73CD66
	for <lists+dm-devel@lfdr.de>; Sun, 25 Jun 2023 01:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687648225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZQfMmUq9QqqTQaHwMM2aFBsEM/HsfwTgEoLOCX23Pp8=;
	b=C9XsCtlQOWQtYkf4cuwlBrCZbHH+wQ5pHdkDj9N40VLLs4RVAenRtJSdOfcVFCZsSQJ39/
	ipkiCaA9GHKpbuKaegTbrV0I/Bbw/TWECNhkgctKGrPCAJJ002vwe4LVGHrWPS7R8uvPDn
	WafQ54V8Tq1ku0hA0QevjFhKJ9xP7Mk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-59YrZ6XjMvqdua2qghDaNg-1; Sat, 24 Jun 2023 19:10:23 -0400
X-MC-Unique: 59YrZ6XjMvqdua2qghDaNg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3456A38035B2;
	Sat, 24 Jun 2023 23:10:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 231A7425363;
	Sat, 24 Jun 2023 23:10:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A02271946A4D;
	Sat, 24 Jun 2023 23:10:04 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4B2E81946587
 for <dm-devel@listman.corp.redhat.com>; Sat, 24 Jun 2023 23:10:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C4B814682F9; Sat, 24 Jun 2023 23:10:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24039140E952
 for <dm-devel@redhat.com>; Sat, 24 Jun 2023 23:10:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 009281008133
 for <dm-devel@redhat.com>; Sat, 24 Jun 2023 23:10:03 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com
 (wout1-smtp.messagingengine.com [64.147.123.24]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-8-fr_Yn3M6mG7WtK1BXAVA-1; Sat, 24 Jun 2023 19:10:00 -0400
X-MC-Unique: 8-fr_Yn3M6mG7WtK1BXAVA-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 6F229320030E;
 Sat, 24 Jun 2023 19:09:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 24 Jun 2023 19:09:59 -0400
X-ME-Sender: <xms:xneXZBC2_hXTPIEzzKwFoPSHoqYHpsLi6lBtfoZjHGP4lnjFcqk6OQ>
 <xme:xneXZPgAvDPHuzSb83HhXFIX_bjVzj2ZdQcAsMAzkLwrs98P05Zd9jsqo08_ifY8S
 -vGYujsztOR08M>
X-ME-Received: <xmr:xneXZMmR69s_IVmBr5FTiTn4ba9awypHUW8C5okI-BejfidesLAjKCQ5Ea8ycgVrj3OzOnscx9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegkedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
 gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:xneXZLwUd0CeuNoW54N0D-MoVp_FBr-uUqbJfQ3JJcOoTJFftsLCWg>
 <xmx:xneXZGSA6NBwWqyuorA6Z2P6w8DTP82sHRMpP6fJQ-sk7ZeBfeS1iQ>
 <xmx:xneXZOYeb2vY51Zm7IZVdOEZCRBuMuTnEj47xRboWFYtPmZDkwyMVg>
 <xmx:x3eXZBe29bwGK9m5W1sCm7Iy6pU92YNDh_4F07l8RGUYr5Wsk1oe5w>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Jun 2023 19:09:58 -0400 (EDT)
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com
Date: Sat, 24 Jun 2023 19:09:44 -0400
Message-ID: <20230624230950.2272-2-demi@invisiblethingslab.com>
In-Reply-To: <20230624230950.2272-1-demi@invisiblethingslab.com>
References: <20230624230950.2272-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH v2 1/4] dm ioctl: Allow userspace to opt-in to
 strict parameter checks
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 linux-kernel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: invisiblethingslab.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, device-mapper ioctls ignore unknown flags.  This makes
adding new flags to a given ioctl risky, as it could potentially break
old userspace.

To solve this problem, allow userspace to pass 5 as the major version to
any ioctl.  This causes the kernel to reject any flags that are not
supported by the ioctl, as well as nonzero padding and names and UUIDs
that are not NUL-terminated.  New flags will only be recognized if major
version 5 is used.  Kernels without this patch return -EINVAL if the
major version is 5, so this is backwards compatible.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/md/dm-ioctl.c         | 286 ++++++++++++++++++++++++++++------
 include/uapi/linux/dm-ioctl.h |  55 ++++++-
 2 files changed, 284 insertions(+), 57 deletions(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 16244a7b193c0ab868fe8b255ab22d9a6e7d01b0..e7693479c0cd974ddde69b3b1c4c67abc2ae3ad6 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -26,6 +26,10 @@
 
 #define DM_MSG_PREFIX "ioctl"
 #define DM_DRIVER_EMAIL "dm-devel@redhat.com"
+#define DM_CLEARED_FLAGS (DM_BUFFER_FULL_FLAG | DM_UEVENT_GENERATED_FLAG | DM_DATA_OUT_FLAG)
+#if DM_CLEARED_FLAGS & ~DM_STRICT_ONLY_FLAGS
+#error incorrect device-mapper flags
+#endif
 
 struct dm_file {
 	/*
@@ -1432,6 +1436,32 @@ static int next_target(struct dm_target_spec *last, uint32_t next, const char *e
 	return 0;
 }
 
+static inline bool sloppy_checks(const struct dm_ioctl *param)
+{
+	return param->version[0] < DM_VERSION_MAJOR_STRICT;
+}
+
+static bool no_non_nul_after_nul(const char *untrusted_str, size_t size,
+				 unsigned int cmd, const char *msg)
+{
+	const char *cursor;
+	const char *endp = untrusted_str + size;
+	const char *nul_terminator = memchr(untrusted_str, '\0', size);
+
+	if (nul_terminator == NULL) {
+		DMERR("%s not NUL-terminated, cmd(%u)", msg, cmd);
+		return false;
+	}
+	for (cursor = nul_terminator; cursor < endp; cursor++) {
+		if (*cursor != 0) {
+			DMERR("%s has non-NUL byte at %zd after NUL byte at %zd, cmd(%u)",
+			      msg, cursor - untrusted_str, nul_terminator - untrusted_str, cmd);
+			return false;
+		}
+	}
+	return true;
+}
+
 static int populate_table(struct dm_table *table,
 			  struct dm_ioctl *param, size_t param_size)
 {
@@ -1442,12 +1472,19 @@ static int populate_table(struct dm_table *table,
 	const char *const end = (const char *) param + param_size;
 	char *target_params;
 	size_t min_size = sizeof(struct dm_ioctl);
+	bool const strict = !sloppy_checks(param);
 
 	if (!param->target_count) {
 		DMERR("%s: no targets specified", __func__);
 		return -EINVAL;
 	}
 
+	if (strict && param_size % 8 != 0) {
+		DMERR("%s: parameter size %zu not multiple of 8",
+		      __func__, param_size);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < param->target_count; i++) {
 		const char *nul_terminator;
 
@@ -1472,6 +1509,18 @@ static int populate_table(struct dm_table *table,
 		/* Add 1 for NUL terminator */
 		min_size = (size_t)(nul_terminator - (const char *)spec) + 1;
 
+		if (strict) {
+			if (!no_non_nul_after_nul(spec->target_type, sizeof(spec->target_type),
+						  DM_TABLE_LOAD_CMD, "target type"))
+				return -EINVAL;
+
+			if (spec->status) {
+				DMERR("%s: status in target spec must be zero, not %u",
+				      __func__, spec->status);
+				return -EINVAL;
+			}
+		}
+
 		r = dm_table_add_target(table, spec->target_type,
 					(sector_t) spec->sector_start,
 					(sector_t) spec->length,
@@ -1482,6 +1531,32 @@ static int populate_table(struct dm_table *table,
 		}
 
 		next = spec->next;
+
+		if (strict) {
+			uint64_t zero = 0;
+			/*
+			 * param_size is a multiple of 8 so this is still in
+			 * bounds (or 1 past the end).
+			 */
+			size_t expected_next = round_up(min_size, 8);
+
+			if (expected_next != next) {
+				DMERR("%s: in strict mode, expected next to be %zu but it was %u",
+				      __func__, expected_next, next);
+				return -EINVAL;
+			}
+
+			if (memcmp(&zero, nul_terminator, next - min_size + 1) != 0) {
+				DMERR("%s: in strict mode, padding must be zeroed", __func__);
+				return -EINVAL;
+			}
+		}
+	}
+
+	if (strict && next != (size_t)(end - (const char *)spec)) {
+		DMERR("%s: last target size is %u, but %zd bytes remaining in target spec",
+		      __func__, next, end - (const char *)spec);
+		return -EINVAL;
 	}
 
 	return dm_table_complete(table);
@@ -1829,48 +1904,72 @@ static int target_message(struct file *filp, struct dm_ioctl *param, size_t para
  * the ioctl.
  */
 #define IOCTL_FLAGS_NO_PARAMS		1
-#define IOCTL_FLAGS_ISSUE_GLOBAL_EVENT	2
+#define IOCTL_FLAGS_TAKES_EVENT_NR      2
+#define IOCTL_FLAGS_ISSUE_GLOBAL_EVENT	(IOCTL_FLAGS_TAKES_EVENT_NR | 4)
 
 /*
  *---------------------------------------------------------------
  * Implementation of open/close/ioctl on the special char device.
  *---------------------------------------------------------------
  */
-static ioctl_fn lookup_ioctl(unsigned int cmd, int *ioctl_flags)
+static ioctl_fn lookup_ioctl(unsigned int cmd, int *ioctl_flags, uint32_t *supported_flags)
 {
 	static const struct {
 		int cmd;
 		int flags;
 		ioctl_fn fn;
+		uint32_t supported_flags;
 	} _ioctls[] = {
-		{DM_VERSION_CMD, 0, NULL}, /* version is dealt with elsewhere */
-		{DM_REMOVE_ALL_CMD, IOCTL_FLAGS_NO_PARAMS | IOCTL_FLAGS_ISSUE_GLOBAL_EVENT, remove_all},
-		{DM_LIST_DEVICES_CMD, 0, list_devices},
+		/* Macro to make the structure initializers somewhat readable */
+#define I(cmd, flags, fn, supported_flags) ((typeof(_ioctls[0])) {				\
+	(cmd),											\
+	(flags),										\
+	(fn),											\
+	/*
+	 * Supported flags in sloppy mode must not include anything in DM_STRICT_ONLY_FLAGS.
+	 * Use BUILD_BUG_ON_ZERO to check for that.  Currently there are no strict-only flags
+	 * defined.
+	 */											\
+	(supported_flags) | BUILD_BUG_ON_ZERO((supported_flags) & DM_STRICT_ONLY_FLAGS),	\
+})
+		I(DM_VERSION_CMD, 0, NULL, 0), /* version is dealt with elsewhere */
+		I(DM_REMOVE_ALL_CMD, IOCTL_FLAGS_NO_PARAMS | IOCTL_FLAGS_ISSUE_GLOBAL_EVENT,
+		  remove_all, DM_DEFERRED_REMOVE),
+		I(DM_LIST_DEVICES_CMD, 0, list_devices, DM_UUID_FLAG),
+		I(DM_DEV_CREATE_CMD, IOCTL_FLAGS_NO_PARAMS | IOCTL_FLAGS_ISSUE_GLOBAL_EVENT,
+		  dev_create, DM_PERSISTENT_DEV_FLAG),
+		I(DM_DEV_REMOVE_CMD, IOCTL_FLAGS_NO_PARAMS | IOCTL_FLAGS_ISSUE_GLOBAL_EVENT,
+		  dev_remove, DM_DEFERRED_REMOVE),
+		I(DM_DEV_RENAME_CMD, IOCTL_FLAGS_ISSUE_GLOBAL_EVENT, dev_rename,
+		 DM_QUERY_INACTIVE_TABLE_FLAG | DM_UUID_FLAG),
+		I(DM_DEV_SUSPEND_CMD, IOCTL_FLAGS_NO_PARAMS, dev_suspend,
+		 DM_QUERY_INACTIVE_TABLE_FLAG | DM_SUSPEND_FLAG | DM_SKIP_LOCKFS_FLAG |
+		 DM_NOFLUSH_FLAG),
+		I(DM_DEV_STATUS_CMD, IOCTL_FLAGS_NO_PARAMS, dev_status,
+		  DM_QUERY_INACTIVE_TABLE_FLAG),
+		I(DM_DEV_WAIT_CMD, IOCTL_FLAGS_TAKES_EVENT_NR, dev_wait,
+		 DM_QUERY_INACTIVE_TABLE_FLAG | DM_STATUS_TABLE_FLAG | DM_NOFLUSH_FLAG),
+		I(DM_TABLE_LOAD_CMD, 0, table_load, DM_QUERY_INACTIVE_TABLE_FLAG |
+		  DM_READONLY_FLAG),
+		I(DM_TABLE_CLEAR_CMD, IOCTL_FLAGS_NO_PARAMS, table_clear,
+		  DM_QUERY_INACTIVE_TABLE_FLAG),
+		I(DM_TABLE_DEPS_CMD, 0, table_deps, DM_QUERY_INACTIVE_TABLE_FLAG),
+		I(DM_TABLE_STATUS_CMD, 0, table_status,
+		 DM_QUERY_INACTIVE_TABLE_FLAG | DM_STATUS_TABLE_FLAG | DM_NOFLUSH_FLAG),
 
-		{DM_DEV_CREATE_CMD, IOCTL_FLAGS_NO_PARAMS | IOCTL_FLAGS_ISSUE_GLOBAL_EVENT, dev_create},
-		{DM_DEV_REMOVE_CMD, IOCTL_FLAGS_NO_PARAMS | IOCTL_FLAGS_ISSUE_GLOBAL_EVENT, dev_remove},
-		{DM_DEV_RENAME_CMD, IOCTL_FLAGS_ISSUE_GLOBAL_EVENT, dev_rename},
-		{DM_DEV_SUSPEND_CMD, IOCTL_FLAGS_NO_PARAMS, dev_suspend},
-		{DM_DEV_STATUS_CMD, IOCTL_FLAGS_NO_PARAMS, dev_status},
-		{DM_DEV_WAIT_CMD, 0, dev_wait},
+		I(DM_LIST_VERSIONS_CMD, 0, list_versions, 0),
 
-		{DM_TABLE_LOAD_CMD, 0, table_load},
-		{DM_TABLE_CLEAR_CMD, IOCTL_FLAGS_NO_PARAMS, table_clear},
-		{DM_TABLE_DEPS_CMD, 0, table_deps},
-		{DM_TABLE_STATUS_CMD, 0, table_status},
-
-		{DM_LIST_VERSIONS_CMD, 0, list_versions},
-
-		{DM_TARGET_MSG_CMD, 0, target_message},
-		{DM_DEV_SET_GEOMETRY_CMD, 0, dev_set_geometry},
-		{DM_DEV_ARM_POLL_CMD, IOCTL_FLAGS_NO_PARAMS, dev_arm_poll},
-		{DM_GET_TARGET_VERSION_CMD, 0, get_target_version},
+		I(DM_TARGET_MSG_CMD, 0, target_message, DM_QUERY_INACTIVE_TABLE_FLAG),
+		I(DM_DEV_SET_GEOMETRY_CMD, 0, dev_set_geometry, 0),
+		I(DM_DEV_ARM_POLL_CMD, IOCTL_FLAGS_NO_PARAMS, dev_arm_poll, 0),
+		I(DM_GET_TARGET_VERSION_CMD, 0, get_target_version, 0),
 	};
 
 	if (unlikely(cmd >= ARRAY_SIZE(_ioctls)))
 		return NULL;
 
 	cmd = array_index_nospec(cmd, ARRAY_SIZE(_ioctls));
+	*supported_flags = _ioctls[cmd].supported_flags;
 	*ioctl_flags = _ioctls[cmd].flags;
 	return _ioctls[cmd].fn;
 }
@@ -1883,6 +1982,7 @@ static int check_version(unsigned int cmd, struct dm_ioctl __user *user,
 			 struct dm_ioctl *kernel_params)
 {
 	int r = 0;
+	uint32_t expected_major_version = DM_VERSION_MAJOR;
 
 	/* Make certain version is first member of dm_ioctl struct */
 	BUILD_BUG_ON(offsetof(struct dm_ioctl, version) != 0);
@@ -1890,10 +1990,14 @@ static int check_version(unsigned int cmd, struct dm_ioctl __user *user,
 	if (copy_from_user(kernel_params->version, user->version, sizeof(kernel_params->version)))
 		return -EFAULT;
 
-	if ((kernel_params->version[0] != DM_VERSION_MAJOR) ||
+	if (kernel_params->version[0] >= DM_VERSION_MAJOR_STRICT)
+		expected_major_version = DM_VERSION_MAJOR_STRICT;
+
+	if ((kernel_params->version[0] != expected_major_version) ||
 	    (kernel_params->version[1] > DM_VERSION_MINOR)) {
 		DMERR("ioctl interface mismatch: kernel(%u.%u.%u), user(%u.%u.%u), cmd(%d)",
-		      DM_VERSION_MAJOR, DM_VERSION_MINOR,
+		      expected_major_version,
+		      DM_VERSION_MINOR,
 		      DM_VERSION_PATCHLEVEL,
 		      kernel_params->version[0],
 		      kernel_params->version[1],
@@ -1905,7 +2009,7 @@ static int check_version(unsigned int cmd, struct dm_ioctl __user *user,
 	/*
 	 * Fill in the kernel version.
 	 */
-	kernel_params->version[0] = DM_VERSION_MAJOR;
+	kernel_params->version[0] = expected_major_version;
 	kernel_params->version[1] = DM_VERSION_MINOR;
 	kernel_params->version[2] = DM_VERSION_PATCHLEVEL;
 	if (copy_to_user(user->version, kernel_params->version, sizeof(kernel_params->version)))
@@ -1931,7 +2035,8 @@ static int copy_params(struct dm_ioctl __user *user, struct dm_ioctl *param_kern
 {
 	struct dm_ioctl *dmi;
 	int secure_data;
-	const size_t minimum_data_size = offsetof(struct dm_ioctl, data);
+	const size_t minimum_data_size = sloppy_checks(param_kernel) ?
+		offsetof(struct dm_ioctl, data) : sizeof(struct dm_ioctl);
 	unsigned int noio_flag;
 
 	/* check_version() already copied version from userspace, avoid TOCTOU */
@@ -1941,12 +2046,13 @@ static int copy_params(struct dm_ioctl __user *user, struct dm_ioctl *param_kern
 		return -EFAULT;
 
 	if (param_kernel->data_size < minimum_data_size) {
-		DMERR("Invalid data size in the ioctl structure: %u",
-		      param_kernel->data_size);
+		DMERR("Invalid data size in the ioctl structure: %u (minimum %zu)",
+		      param_kernel->data_size, minimum_data_size);
 		return -EINVAL;
 	}
 
 	secure_data = param_kernel->flags & DM_SECURE_DATA_FLAG;
+	param_kernel->flags &= ~DM_SECURE_DATA_FLAG;
 
 	*param_flags = secure_data ? DM_WIPE_BUFFER : 0;
 
@@ -1977,7 +2083,8 @@ static int copy_params(struct dm_ioctl __user *user, struct dm_ioctl *param_kern
 	/* Copy from param_kernel (which was already copied from user) */
 	memcpy(dmi, param_kernel, minimum_data_size);
 
-	if (copy_from_user(&dmi->data, (char __user *)user + minimum_data_size,
+	if (copy_from_user((char *)dmi + minimum_data_size,
+			   (char __user *)user + minimum_data_size,
 			   param_kernel->data_size - minimum_data_size))
 		goto bad;
 data_copied:
@@ -1994,33 +2101,99 @@ static int copy_params(struct dm_ioctl __user *user, struct dm_ioctl *param_kern
 	return -EFAULT;
 }
 
-static int validate_params(uint cmd, struct dm_ioctl *param)
+static int validate_params(uint cmd, struct dm_ioctl *param,
+			   uint32_t ioctl_flags, uint32_t supported_flags)
 {
-	/* Always clear this flag */
-	param->flags &= ~DM_BUFFER_FULL_FLAG;
-	param->flags &= ~DM_UEVENT_GENERATED_FLAG;
-	param->flags &= ~DM_SECURE_DATA_FLAG;
-	param->flags &= ~DM_DATA_OUT_FLAG;
+	static_assert(__same_type(param->flags, supported_flags));
 
-	/* Ignores parameters */
-	if (cmd == DM_REMOVE_ALL_CMD ||
-	    cmd == DM_LIST_DEVICES_CMD ||
-	    cmd == DM_LIST_VERSIONS_CMD)
-		return 0;
+	if (sloppy_checks(param)) {
+		/* Clear flags other code expects to be cleared */
+		param->flags &= ~DM_CLEARED_FLAGS;
+
+		/* Ignore validation for certain commands */
+		if (cmd == DM_REMOVE_ALL_CMD ||
+		    cmd == DM_LIST_DEVICES_CMD ||
+		    cmd == DM_LIST_VERSIONS_CMD)
+			return 0;
+	}
 
 	if (cmd == DM_DEV_CREATE_CMD) {
 		if (!*param->name) {
 			DMERR("name not supplied when creating device");
 			return -EINVAL;
 		}
-	} else if (*param->uuid && *param->name) {
-		DMERR("only supply one of name or uuid, cmd(%u)", cmd);
+	} else {
+		if (*param->uuid && *param->name) {
+			DMERR("only supply one of name or uuid, cmd(%u)", cmd);
+			return -EINVAL;
+		}
+	}
+
+	if (sloppy_checks(param)) {
+		/* Ensure strings are terminated */
+		param->name[DM_NAME_LEN - 1] = '\0';
+		param->uuid[DM_UUID_LEN - 1] = '\0';
+		/* Mask off bits that could confuse other code */
+		param->flags &= ~DM_STRICT_ONLY_FLAGS;
+		/* Skip strict checks */
+		return 0;
+	}
+
+	/* Check that strings are terminated */
+	if (!no_non_nul_after_nul(param->name, DM_NAME_LEN, cmd, "Name") ||
+	    !no_non_nul_after_nul(param->uuid, DM_UUID_LEN, cmd, "UUID"))
+		return -EINVAL;
+
+	/*
+	 * This also checks the last byte of the UUID field, but that was
+	 * checked to be zero above.
+	 */
+	if (*(const u64 *)((const char *)param + (sizeof(*param) - 8)) != 0) {
+		DMERR("second padding field not zeroed in strict mode (cmd %u)", cmd);
 		return -EINVAL;
 	}
 
-	/* Ensure strings are terminated */
-	param->name[DM_NAME_LEN - 1] = '\0';
-	param->uuid[DM_UUID_LEN - 1] = '\0';
+	if ((param->flags & ~supported_flags) != 0) {
+		DMERR("unsupported flags 0x%x specified, cmd(%u)",
+		      param->flags & ~supported_flags, cmd);
+		return -EINVAL;
+	}
+
+	if (param->padding != 0) {
+		DMERR("padding not zeroed in strict mode (got %u, cmd %u)",
+		      param->padding, cmd);
+		return -EINVAL;
+	}
+
+	if (param->open_count != 0) {
+		DMERR("open_count not zeroed in strict mode (got %d, cmd %u)",
+		      param->open_count, cmd);
+		return -EINVAL;
+	}
+
+	if (param->event_nr != 0 && (ioctl_flags & IOCTL_FLAGS_TAKES_EVENT_NR) == 0) {
+		DMERR("Event number not zeroed for command that does not take one (got %u, cmd %u)",
+		      param->event_nr, cmd);
+		return -EINVAL;
+	}
+
+	if (ioctl_flags & IOCTL_FLAGS_NO_PARAMS) {
+		/* Ignores parameters */
+		if (param->data_size != sizeof(struct dm_ioctl)) {
+			DMERR("command %u must not have parameters", cmd);
+			return -EINVAL;
+		}
+
+		if (param->target_count != 0) {
+			DMERR("command %u must have zero target_count", cmd);
+			return -EINVAL;
+		}
+
+		if (param->data_start) {
+			DMERR("command %u must have zero data_start", cmd);
+			return -EINVAL;
+		}
+	}
 
 	return 0;
 }
@@ -2035,6 +2208,7 @@ static int ctl_ioctl(struct file *file, uint command, struct dm_ioctl __user *us
 	ioctl_fn fn = NULL;
 	size_t input_param_size;
 	struct dm_ioctl param_kernel;
+	uint32_t supported_flags, old_flags;
 
 	/* only root can play with this */
 	if (!capable(CAP_SYS_ADMIN))
@@ -2050,7 +2224,7 @@ static int ctl_ioctl(struct file *file, uint command, struct dm_ioctl __user *us
 	 * writes out the kernel's interface version.
 	 */
 	r = check_version(cmd, user, &param_kernel);
-	if (r)
+	if (r != 0)
 		return r;
 
 	/*
@@ -2059,7 +2233,7 @@ static int ctl_ioctl(struct file *file, uint command, struct dm_ioctl __user *us
 	if (cmd == DM_VERSION_CMD)
 		return 0;
 
-	fn = lookup_ioctl(cmd, &ioctl_flags);
+	fn = lookup_ioctl(cmd, &ioctl_flags, &supported_flags);
 	if (!fn) {
 		DMERR("dm_ctl_ioctl: unknown command 0x%x", command);
 		return -ENOTTY;
@@ -2074,11 +2248,22 @@ static int ctl_ioctl(struct file *file, uint command, struct dm_ioctl __user *us
 		return r;
 
 	input_param_size = param->data_size;
-	r = validate_params(cmd, param);
+
+	/*
+	 * In sloppy mode, validate_params will clear some
+	 * flags to ensure other code does not get confused.
+	 * Save the original flags here, except for some that
+	 * have always been cleared.
+	 */
+	old_flags = param->flags & ~DM_CLEARED_FLAGS;
+	r = validate_params(cmd, param, ioctl_flags, supported_flags);
 	if (r)
 		goto out;
+	/* This XOR keeps only the flags validate_params has changed. */
+	old_flags ^= param->flags;
 
-	param->data_size = offsetof(struct dm_ioctl, data);
+	param->data_size = sloppy_checks(param) ?
+		offsetof(struct dm_ioctl, data) : sizeof(struct dm_ioctl);
 	r = fn(file, param, input_param_size);
 
 	if (unlikely(param->flags & DM_BUFFER_FULL_FLAG) &&
@@ -2088,6 +2273,9 @@ static int ctl_ioctl(struct file *file, uint command, struct dm_ioctl __user *us
 	if (!r && ioctl_flags & IOCTL_FLAGS_ISSUE_GLOBAL_EVENT)
 		dm_issue_global_event();
 
+	/* Resture the flags that validate_params cleared */
+	param->flags |= old_flags;
+
 	/*
 	 * Copy the results back to userland.
 	 */
diff --git a/include/uapi/linux/dm-ioctl.h b/include/uapi/linux/dm-ioctl.h
index 1990b5700f6948243def314cec22f380926aca2e..62bfdc95ebccb2f1c20c24496a449fe3e2a76113 100644
--- a/include/uapi/linux/dm-ioctl.h
+++ b/include/uapi/linux/dm-ioctl.h
@@ -98,7 +98,11 @@
  * All ioctl arguments consist of a single chunk of memory, with
  * this structure at the start.  If a uuid is specified any
  * lookup (eg. for a DM_INFO) will be done on that, *not* the
- * name.
+ * name.  In strict mode, the name and UUID fields must be
+ * NUL-terminated and must not have a non-NUL byte following a
+ * NUL byte.  In sloppy mode, the last byte of these fields will
+ * be overwritten with NUL, and any bytes after the first NUL are
+ * ignored.
  */
 struct dm_ioctl {
 	/*
@@ -117,10 +121,16 @@ struct dm_ioctl {
 	 */
 	__u32 version[3];	/* in/out */
 	__u32 data_size;	/* total size of data passed in
-				 * including this struct */
+				 * including this struct, must be
+				 * multiple of 8 in strict mode
+				 */
 
 	__u32 data_start;	/* offset to start of data
-				 * relative to start of this struct */
+				 * relative to start of this struct,
+				 * must be at least offsetof(struct dm_ioctl, data)
+				 * in sloppy mode and at least sizeof(struct dm_ioctl)
+				 * in strict mode
+				 */
 
 	__u32 target_count;	/* in/out */
 	__s32 open_count;	/* out */
@@ -143,7 +153,7 @@ struct dm_ioctl {
 	char name[DM_NAME_LEN];	/* device name */
 	char uuid[DM_UUID_LEN];	/* unique identifier for
 				 * the block device */
-	char data[7];		/* padding or data */
+	char data[7];		/* padding or data, must be zero in strict mode */
 };
 
 /*
@@ -171,8 +181,11 @@ struct dm_target_spec {
 
 	/*
 	 * Parameter string starts immediately after this object.
-	 * Be careful to add padding after string to ensure correct
-	 * alignment of subsequent dm_target_spec.
+	 * Be careful to add padding after string to ensure 8-byte
+	 * alignment of subsequent dm_target_spec.  If the major version
+	 * is DM_VERSION_MAJOR_STRICT, the padding must be at most 7 bytes,
+	 * (not including the terminating NULt that ends the string) and
+	 * must be zeroed.
 	 */
 };
 
@@ -285,14 +298,28 @@ enum {
 #define DM_TARGET_MSG	 _IOWR(DM_IOCTL, DM_TARGET_MSG_CMD, struct dm_ioctl)
 #define DM_DEV_SET_GEOMETRY	_IOWR(DM_IOCTL, DM_DEV_SET_GEOMETRY_CMD, struct dm_ioctl)
 
+/* Legacy major version.  Activates "sloppy mode" in the parameter parser. */
 #define DM_VERSION_MAJOR	4
-#define DM_VERSION_MINOR	48
+/*
+ * New major version.  Enforces strict parameter checks and is required for
+ * using some new features, such as new flags.  Should be used by all new code.
+ * Activates "strict mode" in the parameter parser.
+ *
+ * If one uses DM_VERSION_MAJOR_STRICT, it is possible for the behavior of
+ * ioctls to depend on the minor version passed by userspace.  Userspace must
+ * not pass a minor version greater than the version it was designed for.
+ */
+#define DM_VERSION_MAJOR_STRICT 5
+#define DM_VERSION_MINOR	49
 #define DM_VERSION_PATCHLEVEL	0
 #define DM_VERSION_EXTRA	"-ioctl (2023-03-01)"
 
 /* Status bits */
 #define DM_READONLY_FLAG	(1 << 0) /* In/Out */
 #define DM_SUSPEND_FLAG		(1 << 1) /* In/Out */
+#define DM_EXISTS_FLAG		(1 << 2) /* Not used by kernel, reserved for
+					  * libdevmapper in userland
+					  */
 #define DM_PERSISTENT_DEV_FLAG	(1 << 3) /* In */
 
 /*
@@ -315,7 +342,8 @@ enum {
 #define DM_BUFFER_FULL_FLAG	(1 << 8) /* Out */
 
 /*
- * This flag is now ignored.
+ * This flag is now ignored if DM_VERSION_MAJOR is used, and causes
+ * -EINVAL if DM_VERSION_MAJOR_STRICT is used.
  */
 #define DM_SKIP_BDGET_FLAG	(1 << 9) /* In */
 
@@ -382,4 +410,15 @@ enum {
  */
 #define DM_IMA_MEASUREMENT_FLAG	(1 << 19) /* In */
 
+/*
+ * If DM_VERSION_MAJOR is used, these flags are ignored by the kernel.
+ * If DM_VERSION_MAJOR_STRICT is used, these flags are reserved and
+ * must be zeroed.
+ */
+#define DM_STRICT_ONLY_FLAGS					\
+	(DM_ACTIVE_PRESENT_FLAG | DM_INACTIVE_PRESENT_FLAG |	\
+	 1 << 7 | DM_BUFFER_FULL_FLAG | DM_SKIP_BDGET_FLAG |	\
+	 DM_UEVENT_GENERATED_FLAG  | DM_DATA_OUT_FLAG |		\
+	 DM_INTERNAL_SUSPEND_FLAG | -(1 << 20))
+
 #endif				/* _LINUX_DM_IOCTL_H */
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

