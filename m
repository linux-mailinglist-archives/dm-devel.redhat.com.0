Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B831420AEBB
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 11:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593162537;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qeFmpJeot4Ip6bgrwmUKf/V3ZTMiScbh+dxZc8U6kqM=;
	b=G+I7lR36h8B6NujW5BFNpQEgPVvzQdXf/5A63xz3w3jDWeVGdWPh3gRzK5WcLvcBytxDql
	Lm4RA7AJKTHimVyX6GQtJ0UTuZuQbC69BuNlwTZ1BQsidZScl6GuLftlrZQYHvg9qfQTzn
	CmsIcwg9IbvvYd8jEyT/RcYOpR7thhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-TTJoJnErMDW3hLN8hAh5RA-1; Fri, 26 Jun 2020 05:08:55 -0400
X-MC-Unique: TTJoJnErMDW3hLN8hAh5RA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 013BC10059A8;
	Fri, 26 Jun 2020 09:08:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C57B7B600;
	Fri, 26 Jun 2020 09:08:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 29EE5833A2;
	Fri, 26 Jun 2020 09:08:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05Q98REi027596 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 05:08:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F5B62018299; Fri, 26 Jun 2020 09:08:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B6162018297
	for <dm-devel@redhat.com>; Fri, 26 Jun 2020 09:08:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD311858F0A
	for <dm-devel@redhat.com>; Fri, 26 Jun 2020 09:08:24 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-218-pVwBvtivMeOlz-k6hKa-zA-1;
	Fri, 26 Jun 2020 05:08:22 -0400
X-MC-Unique: pVwBvtivMeOlz-k6hKa-zA-1
IronPort-SDR: l3yH3Au9qGZEPARGQ9PUK8HHOeZvc8+myadGlZE6Zt+1bENT6CIGxtPBatQX0heIMZNafB31uC
	7eM3Grc7ErEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="125468926"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="125468926"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	26 Jun 2020 02:07:18 -0700
IronPort-SDR: vu82SLRINGlflMSazI3fYmfFsi8ullXCdinVFWXNjAXeEqUn/Zy/LufD1yC8AdwYGwcQ0Taud4
	Huwxpep1L8BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="479767722"
Received: from apaszkie-desk.igk.intel.com ([10.102.102.225])
	by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2020 02:07:17 -0700
To: dm-devel@redhat.com
From: Artur Paszkiewicz <artur.paszkiewicz@intel.com>
Message-ID: <fb4877be-4d88-2816-9000-dcc540e8c093@intel.com>
Date: Fri, 26 Jun 2020 11:07:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05Q98REi027596
X-loop: dm-devel@redhat.com
Subject: [dm-devel] dm-crypt hard lockup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'm getting regular lockups which seem to be caused by dm-crypt. I
reproduced it on vanilla v5.8-rc2, but I started regularly seeing this
some time ago on openSUSE Tumbleweed kernels. It's easily reproducible
(every time, after about a minute) when I run "make -j" on the linux
kernel sources, sometimes it occurs also when doing other IO intensive
tasks on multiple CPUs. I'm using LVM and ext4 on dm-crypt devices,
Intel SSDSC2KW010X6 and SSDSC2BA200G3 SSDs.

Regards,
Artur

[  248.471327] BUG: workqueue lockup - pool cpus=8 node=0 flags=0x0 nice=0 stuck for 50s!
[  248.480317] Showing busy workqueues and worker pools:
[  248.486434] workqueue events: flags=0x0
[  248.491364]   pwq 16: cpus=8 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[  248.495357]     pending: dbs_work_handler
[  248.504479]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[  248.508474]     pending: dbs_work_handler
[  248.517546] workqueue events_power_efficient: flags=0x80
[  248.523989]   pwq 0: cpus=0 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[  248.527980]     pending: fb_flashcursor
[  248.536942] workqueue events_freezable_power_: flags=0x84
[  248.543494]   pwq 16: cpus=8 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[  248.547486]     in-flight: 2357:disk_events_workfn
[  248.557530] workqueue mm_percpu_wq: flags=0x8
[  248.563075]   pwq 16: cpus=8 node=0 flags=0x0 nice=0 active=2/256 refcnt=4
[  248.567068]     pending: vmstat_update, drain_local_pages_wq BAR(160)
[  248.578883] workqueue writeback: flags=0x4a
[  248.584305]   pwq 48: cpus=0-23 flags=0x5 nice=0 active=2/256 refcnt=6 MAYDAY
[  248.588300]     in-flight: 188(RESCUER):wb_workfn wb_workfn
[  248.599547] workqueue kcryptd/254:0: flags=0x2a
[  248.605332]   pwq 48: cpus=0-23 flags=0x5 nice=0 active=24/24 refcnt=279754
[  248.609327]     in-flight: 169:kcryptd_crypt [dm_crypt], 173:kcryptd_crypt [dm_crypt], 161:kcryptd_crypt [dm_crypt], 8:kcryptd_crypt [dm_crypt], 165:kcryptd_crypt [dm_crypt], 155:kcryptd_crypt [dm_crypt], 164:kcryptd_crypt [dm_crypt], 174:kcryptd_crypt [dm_crypt], 163:kcryptd_crypt [dm_crypt], 158:kcryptd_crypt [dm_crypt], 156:kcryptd_crypt [dm_crypt], 168:kcryptd_crypt [dm_crypt], 159:kcryptd_crypt [dm_crypt], 157:kcryptd_crypt [dm_crypt], 166:kcryptd_crypt [dm_crypt], 1090(RESCUER):kcryptd_crypt [dm_crypt], 160:kcryptd_crypt [dm_crypt], 154:kcryptd_crypt [dm_crypt], 162:kcryptd_crypt [dm_crypt], 171:kcryptd_crypt [dm_crypt], 167:kcryptd_crypt [dm_crypt], 175:kcryptd_crypt [dm_crypt], 170:kcryptd_crypt [dm_crypt], 172:kcryptd_crypt [dm_crypt]
[  248.651333]     delayed: kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt]
[  248.651333] , kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_c
 rypt]
[  248.779324] , kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_c
 rypt]
[  248.807337] , kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_c
 rypt]
(a lot of these repeated messages...)
[  255.407326] , kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_c
 rypt]
[  255.535363] , kcryptd_crypt [dm_crypt]
[  249.291345] NMI watchdog: Watchdog detected hard LOCKUP on cpu 7
[  249.291345] Modules linked in: af_packet xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_tables bpfilter tun bridge pktcdvd stp llc cmac algif_hash algif_skcipher af_alg bnep dmi_sysfs snd_seq msr intel_rapl_msr intel_rapl_common nls_iso8859_1 nls_cp437 vfat fat snd_usb_audio btusb sb_edac mei_hdcp snd_usbmidi_lib btrtl iTCO_wdt mei_wdt iTCO_vendor_support snd_hda_codec_realtek snd_rawmidi btbcm dcdbas x86_pkg_temp_thermal snd_seq_device btintel dell_smm_hwmon intel_powerclamp snd_hda_codec_generic snd_hda_codec_hdmi ledtrig_audio mc coretemp snd_hda_intel bluetooth snd_intel_dspcfg snd_hda_codec kvm_intel snd_hda_core snd_hwdep snd_pcm ecdh_generic r8169 rfkill mei_me snd_timer ecc realtek kvm i2c_i801 snd e1000e libphy irqbypass efi_pstore pcspkr mei i2c_smbus s
 oundcore
[  249.291345]  lpc_ich nfsd nfs_acl lockd grace auth_rpcgss sunrpc dm_crypt hid_generic usbhid xhci_pci xhci_hcd ehci_pci crct10dif_pclmul ehci_hcd crc32_pclmul crc32c_intel ghash_clmulni_intel aesni_intel usbcore glue_helper crypto_simd cryptd sr_mod cdrom wmi button dm_mirror dm_region_hash dm_log sg dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua dm_snapshot dm_bufio dm_mod efivarfs
[  249.291345] irq event stamp: 8878
[  249.291345] hardirqs last  enabled at (8877): [<ffffffffb22b1964>] _raw_spin_unlock_irq+0x24/0x30
[  249.291345] hardirqs last disabled at (8878): [<ffffffffb22aa8aa>] __schedule+0xda/0x980
[  249.291345] softirqs last  enabled at (8178): [<ffffffffb260036d>] __do_softirq+0x36d/0x410
[  249.291345] softirqs last disabled at (8165): [<ffffffffb24010d2>] asm_call_on_stack+0x12/0x20
[  249.291345] CPU: 7 PID: 155 Comm: kworker/u48:2 Not tainted 5.8.0-rc2-1-default #453
[  249.291345] Hardware name: Dell Inc. Precision T3610/09M8Y8, BIOS A12 09/09/2016
[  249.291345] Workqueue: kcryptd/254:0 kcryptd_crypt [dm_crypt]
[  249.291345] RIP: 0010:native_queued_spin_lock_slowpath+0x122/0x1c0
[  249.291345] Code: 2b 71 4e c3 41 83 c0 01 c1 e1 10 41 c1 e0 12 44 09 c1 89 c8 c1 e8 10 66 87 47 02 89 c6 c1 e6 10 75 4c 31 f6 eb 02 f3 90 8b 07 <66> 85 c0 75 f7 41 89 c0 66 45 31 c0 44 39 c1 74 74 c6 07 01 48 85
[  249.291345] RSP: 0000:ffffbeacc06d7e38 EFLAGS: 00000002
[  249.291345] RAX: 0000000000180101 RBX: ffff9c4fa0a689a0 RCX: 0000000000200000
[  249.291345] RDX: ffff9c4fcf9f1240 RSI: 0000000000000000 RDI: ffff9c4887c11c00
[  249.291345] RBP: ffff9c4887c11c00 R08: 0000000000200000 R09: 0000000000000001
[  249.291345] R10: ffff9c4886948000 R11: ffff9c4fcfd705f0 R12: ffff9c4fa2b08300
[  249.291345] R13: ffff9c4886977a40 R14: 0000000000000020 R15: ffff9c4886977a40
[  249.291345] FS:  0000000000000000(0000) GS:ffff9c4fcf9c0000(0000) knlGS:0000000000000000
[  249.291345] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  249.291345] CR2: 00007f9761d1fa93 CR3: 000000025ed0c005 CR4: 00000000001606e0
[  249.291345] Call Trace:
[  249.291345]  do_raw_spin_lock+0xb2/0xc0
[  249.291345]  process_one_work+0x2e4/0x570
[  249.291345]  worker_thread+0x4a/0x3c0
[  249.291345]  ? process_one_work+0x570/0x570
[  249.291345]  kthread+0x102/0x140
[  249.291345]  ? kthread_park+0x90/0x90
[  249.291345]  ret_from_fork+0x22/0x30
[  249.291345] Kernel panic - not syncing: Hard LOCKUP
[  249.291345] CPU: 7 PID: 155 Comm: kworker/u48:2 Not tainted 5.8.0-rc2-1-default #453
[  249.291345] Hardware name: Dell Inc. Precision T3610/09M8Y8, BIOS A12 09/09/2016
[  249.291345] Workqueue: kcryptd/254:0 kcryptd_crypt [dm_crypt]
[  249.291345] Call Trace:
[  249.291345]  <NMI>
[  249.291345]  dump_stack+0x96/0xd0
[  249.291345]  panic+0x106/0x2fb
[  249.291345]  nmi_panic.cold+0xc/0xc
[  249.291345]  watchdog_overflow_callback.cold+0x6a/0x7e
[  249.291345]  __perf_event_overflow+0x52/0xf0
[  249.291345]  handle_pmi_common+0x1cc/0x270
[  249.291345]  ? acpi_os_read_memory+0x5/0x270
[  249.291345]  ? __set_pte_vaddr+0x28/0x40
[  249.291345]  ? flush_tlb_one_kernel+0xa/0x20
[  249.291345]  ? __native_set_fixmap+0x24/0x30
[  249.291345]  ? ghes_copy_tofrom_phys+0x97/0x130
[  249.291345]  intel_pmu_handle_irq+0xc1/0x160
[  249.291345]  perf_event_nmi_handler+0x2f/0x50
[  249.291345]  nmi_handle+0xda/0x250
[  249.291345]  default_do_nmi+0x45/0x110
[  249.291345]  exc_nmi+0x1b1/0x1f0
[  249.291345]  end_repeat_nmi+0x16/0x50
[  249.291345] RIP: 0010:native_queued_spin_lock_slowpath+0x122/0x1c0
[  249.291345] Code: 2b 71 4e c3 41 83 c0 01 c1 e1 10 41 c1 e0 12 44 09 c1 89 c8 c1 e8 10 66 87 47 02 89 c6 c1 e6 10 75 4c 31 f6 eb 02 f3 90 8b 07 <66> 85 c0 75 f7 41 89 c0 66 45 31 c0 44 39 c1 74 74 c6 07 01 48 85
[  249.291345] RSP: 0000:ffffbeacc06d7e38 EFLAGS: 00000002
[  249.291345] RAX: 0000000000180101 RBX: ffff9c4fa0a689a0 RCX: 0000000000200000
[  249.291345] RDX: ffff9c4fcf9f1240 RSI: 0000000000000000 RDI: ffff9c4887c11c00
[  249.291345] RBP: ffff9c4887c11c00 R08: 0000000000200000 R09: 0000000000000001
[  249.291345] R10: ffff9c4886948000 R11: ffff9c4fcfd705f0 R12: ffff9c4fa2b08300
[  249.291345] R13: ffff9c4886977a40 R14: 0000000000000020 R15: ffff9c4886977a40
[  249.291345]  ? native_queued_spin_lock_slowpath+0x122/0x1c0
[  249.291345]  ? native_queued_spin_lock_slowpath+0x122/0x1c0
[  249.291345]  </NMI>
[  249.291345]  do_raw_spin_lock+0xb2/0xc0
[  249.291345]  process_one_work+0x2e4/0x570
[  249.291345]  worker_thread+0x4a/0x3c0
[  249.291345]  ? process_one_work+0x570/0x570
[  249.291345]  kthread+0x102/0x140
[  249.291345]  ? kthread_park+0x90/0x90
[  249.291345]  ret_from_fork+0x22/0x30
[  255.671350] , kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_c
 rypt]
[  255.671350] , kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_c
 rypt]
[  255.671350] , kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_crypt [dm_crypt], kcryptd_c[  255.671350] , kcryptd_crypt [dm_crypt]
[  249.291345] Shutting down cpus with NMI
[  249.291345] Kernel Offset: 0x30800000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

