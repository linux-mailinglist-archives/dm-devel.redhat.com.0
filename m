Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 77330277293
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:37:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-iDbqy7IyMCysiLLmOvZ-1Q-1; Thu, 24 Sep 2020 09:37:45 -0400
X-MC-Unique: iDbqy7IyMCysiLLmOvZ-1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 331F7186DD35;
	Thu, 24 Sep 2020 13:37:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 117AD60C04;
	Thu, 24 Sep 2020 13:37:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFE938C7A7;
	Thu, 24 Sep 2020 13:37:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODbH1W025507 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:37:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2E8020244F7; Thu, 24 Sep 2020 13:37:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA3A1200A7CD
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7517418AE947
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:12 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-593-WpIOJc_9OnqLWKbcg54tWg-1;
	Thu, 24 Sep 2020 09:37:09 -0400
X-MC-Unique: WpIOJc_9OnqLWKbcg54tWg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 06059AE44;
	Thu, 24 Sep 2020 13:37:07 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:36:42 +0200
Message-Id: <20200924133644.14034-10-mwilck@suse.com>
In-Reply-To: <20200924133644.14034-1-mwilck@suse.com>
References: <20200924133644.14034-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODbH1W025507
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 09/11] libmultipath: add linker version script
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This version script documents the current ABI of libmultipath,
as used by multipath, multipathd, (lib)mpathpersist, and the
dynamically loaded libraries (prioritizers, checkers, and foreign).

This reduces the amount of exported symbols of libmultipath.so.0
by more than a half (199 vs. 434).
---
 libmultipath/Makefile             |   7 +-
 libmultipath/libmultipath.version | 215 ++++++++++++++++++++++++++++++
 2 files changed, 220 insertions(+), 2 deletions(-)
 create mode 100644 libmultipath/libmultipath.version

diff --git a/libmultipath/Makefile b/libmultipath/Makefile
index cf13561..bfc7263 100644
--- a/libmultipath/Makefile
+++ b/libmultipath/Makefile
@@ -6,6 +6,7 @@ include ../Makefile.inc
 SONAME = 0
 DEVLIB = libmultipath.so
 LIBS = $(DEVLIB).$(SONAME)
+VERSION_SCRIPT := libmultipath.version
 
 CFLAGS += $(LIB_CFLAGS) -I$(mpathcmddir) -I$(mpathpersistdir) -I$(nvmedir)
 
@@ -68,8 +69,10 @@ nvme-ioctl.c: nvme/nvme-ioctl.c
 nvme-ioctl.h: nvme/nvme-ioctl.h
 	$(call make_static,$<,$@)
 
-$(LIBS): $(OBJS)
-	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS) $(LIBDEPS)
+
+$(LIBS): $(OBJS) $(VERSION_SCRIPT)
+	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ \
+		-Wl,--version-script=$(VERSION_SCRIPT) -o $@ $(OBJS) $(LIBDEPS)
 
 $(DEVLIB): $(LIBS)
 	$(LN) $(LIBS) $@
diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
new file mode 100644
index 0000000..d6ac0e1
--- /dev/null
+++ b/libmultipath/libmultipath.version
@@ -0,0 +1,215 @@
+LIBMULTIPATH_0.8.4.0 {
+global:
+	/* symbols referenced by multipath and multipathd */
+	add_foreign;
+	add_map_with_path;
+	adopt_paths;
+	alloc_multipath;
+	alloc_path;
+	alloc_path_with_pathinfo;
+	alloc_strvec;
+	change_foreign;
+	check_alias_settings;
+	checker_clear_message;
+	checker_disable;
+	checker_enable;
+	checker_is_sync;
+	checker_message;
+	checker_name;
+	checker_state_name;
+	check_foreign;
+	cleanup_checkers;
+	cleanup_foreign;
+	cleanup_lock;
+	cleanup_prio;
+	close_fd;
+	coalesce_paths;
+	convert_dev;
+	count_active_paths;
+	delete_all_foreign;
+	delete_foreign;
+	disassemble_map;
+	disassemble_status;
+	dlog;
+	dm_cancel_deferred_remove;
+	dm_drv_version;
+	dm_enablegroup;
+	dm_fail_path;
+	_dm_flush_map;
+	dm_flush_map_nopaths;
+	dm_flush_maps;
+	dm_geteventnr;
+	dm_get_info;
+	dm_get_major_minor;
+	dm_get_map;
+	dm_get_maps;
+	dm_get_multipath;
+	dm_get_status;
+	dm_get_uuid;
+	dm_is_mpath;
+	dm_mapname;
+	dm_map_present;
+	dm_queue_if_no_path;
+	dm_reassign;
+	dm_reinstate_path;
+	dm_simplecmd_noflush;
+	dm_switchgroup;
+	dm_tgt_version;
+	domap;
+	ensure_directories_exist;
+	extract_hwe_from_path;
+	filter_devnode;
+	filter_path;
+	filter_wwid;
+	find_mp_by_alias;
+	find_mp_by_minor;
+	find_mp_by_str;
+	find_mp_by_wwid;
+	find_mpe;
+	find_path_by_dev;
+	find_path_by_devt;
+	find_slot;
+	foreign_multipath_layout;
+	foreign_path_layout;
+	free_config;
+	free_multipath;
+	free_multipathvec;
+	free_path;
+	free_pathvec;
+	free_strvec;
+	get_monotonic_time;
+	get_multipath_layout;
+	get_path_layout;
+	get_pgpolicy_id;
+	get_refwwid;
+	get_state;
+	get_udev_device;
+	get_uid;
+	get_used_hwes;
+	group_by_prio;
+	init_checkers;
+	init_foreign;
+	init_prio;
+	io_err_stat_attr;
+	io_err_stat_handle_pathfail;
+	is_path_valid;
+	is_quote;
+	libmp_dm_task_create;
+	libmp_udev_set_sync_support;
+	load_config;
+	log_thread_reset;
+	log_thread_start;
+	log_thread_stop;
+	need_io_err_check;
+	normalize_timespec;
+	orphan_path;
+	orphan_paths;
+	parse_prkey_flags;
+	pathcount;
+	path_discovery;
+	path_get_tpgs;
+	pathinfo;
+	path_offline;
+	print_all_paths;
+	print_foreign_topology;
+	_print_multipath_topology;
+	pthread_cond_init_mono;
+	recv_packet;
+	recv_packet_from_client;
+	reinstate_paths;
+	remember_wwid;
+	remove_map;
+	remove_map_by_alias;
+	remove_maps;
+	remove_wwid;
+	replace_wwids;
+	reset_checker_classes;
+	select_all_tg_pt;
+	select_action;
+	select_find_multipaths_timeout;
+	select_no_path_retry;
+	select_path_group;
+	select_reservation_key;
+	send_packet;
+	set_max_fds;
+	__set_no_path_retry;
+	set_path_removed;
+	set_prkey;
+	setup_map;
+	setup_thread_attr;
+	should_multipath;
+	snprint_blacklist_report;
+	snprint_config;
+	snprint_devices;
+	snprint_foreign_multipaths;
+	snprint_foreign_paths;
+	snprint_foreign_topology;
+	_snprint_multipath;
+	snprint_multipath_header;
+	snprint_multipath_map_json;
+	_snprint_multipath_topology;
+	snprint_multipath_topology_json;
+	_snprint_path;
+	snprint_path_header;
+	snprint_status;
+	snprint_wildcards;
+	stop_io_err_stat_thread;
+	store_path;
+	store_pathinfo;
+	strchop;
+	strlcpy;
+	sync_map_state;
+	sysfs_attr_set_value;
+	sysfs_get_size;
+	sysfs_is_multipathed;
+	timespecsub;
+	trigger_paths_udev_change;
+	uevent_dispatch;
+	uevent_get_dm_str;
+	uevent_get_env_positive_int;
+	uevent_is_mpath;
+	uevent_listen;
+	update_mpp_paths;
+	update_multipath_status;
+	update_multipath_strings;
+	update_multipath_table;
+	update_pathvec_from_dm;
+	update_queue_mode_add_path;
+	update_queue_mode_del_path;
+	ux_socket_listen;
+	valid_alias;
+	vector_alloc;
+	vector_alloc_slot;
+	vector_del_slot;
+	vector_free;
+	vector_reset;
+	vector_set_slot;
+	verify_paths;
+
+	/* checkers */
+	sg_read;
+
+	/* prioritizers */
+	get_asymmetric_access_state;
+	get_prio_timeout;
+	get_target_port_group;
+	get_target_port_group_support;
+	libmp_nvme_ana_log;
+	libmp_nvme_get_nsid;
+	libmp_nvme_identify_ns;
+	log_nvme_errcode;
+	nvme_id_ctrl_ana;
+	snprint_host_wwnn;
+	snprint_host_wwpn;
+	snprint_path_serial;
+	snprint_tgt_wwnn;
+	snprint_tgt_wwpn;
+	sysfs_get_asymmetric_access_state;
+
+	/* foreign */
+	free_scandir_result;
+	sysfs_attr_get_value;
+
+local:
+	*;
+};
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

