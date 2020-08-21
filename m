Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id ACFB624CCDC
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 06:43:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-_ocfYPy7Pa2CTA3v3lZFhA-1; Fri, 21 Aug 2020 00:43:03 -0400
X-MC-Unique: _ocfYPy7Pa2CTA3v3lZFhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7C391DE0E;
	Fri, 21 Aug 2020 04:42:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEAE1756CB;
	Fri, 21 Aug 2020 04:42:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F50059CCD;
	Fri, 21 Aug 2020 04:42:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07L4fq1m031991 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 00:41:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34A8AF51AA; Fri, 21 Aug 2020 04:41:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30860F4EB2
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 04:41:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49A1289CD48
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 04:41:49 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-272-ktkqI0KVNLqquY1up3bTwg-1; Fri, 21 Aug 2020 00:41:43 -0400
X-MC-Unique: ktkqI0KVNLqquY1up3bTwg-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id E566B84D2F05D97F47F7;
	Fri, 21 Aug 2020 12:41:38 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Fri, 21 Aug 2020
	12:41:28 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, <dm-devel@redhat.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
	<285a42f1-69c2-ce2e-e30c-d12fb6edc859@huawei.com>
	<854ae1d12f9db76db005c317aaa213aadee07952.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <547908f2-e1f4-be87-fabf-e361511d13b5@huawei.com>
Date: Fri, 21 Aug 2020 12:41:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <854ae1d12f9db76db005c317aaa213aadee07952.camel@suse.com>
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Subject: Re: [dm-devel] [PATCH 2/5] libmultipath fix NULL dereference in
	select_action
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Martin:
   Thanks for your reply.

On 2020/8/19 0:28, Martin Wilck wrote:
> On Tue, 2020-08-18 at 21:06 +0800, lixiaokeng wrote:
>>
>> There are many NULL pointers in cmpp such as selector, features,
>> hwhandler and so on.
>> Here these on mpp is not NULL  but we can not be sure that won't be
>> in mpp, so we
>> add checking pointers of both mpp and cmpp before using them.
>>
>> The changes like "mpp->features != cmpp->features" make sure that
>> mpp->action is not
>> set to ACT_RELOAD when they both equal NULL. Other changes check
>> pointers don't equal
>> NULL. When only one is NULL, we think there is some difference
>> between mpp and cmpp,
>> so mpp->action should be set to ACT_RELOAD.
> 
> Hm. We should be able to make some assumptions about validity of
> structure fields.
> 
> I'd like to understand better what's going wrong here. cmpp is
> taken from curmp, which has been populated in get_dm_mpvec().
> get_dm_mpvec() calls disassemble_map(), which would always allocate
> mpp->features, AFAICS. Well, always, except if the parameter string was
> totally broken (or memory allocation failed):
>
   I add some printing in get_dm_mpvec, but I did not get any useful
information in messages. But we can see that there are path in mpp->pg.
The following are mpp and cmpp when coredump cause:

(gdb) p *mpp
$9 = {wwid = "36001405ef6a7bc355084b3abcb236a4c", '\000' <repeats 94 times>,
  alias_old = '\000' <repeats 127 times>, pgpolicy = 1,
  pgpolicyfn = 0x7f5fc886e0b0 <one_path_per_group>, nextpg = 0, bestpg = 1,
  queuedio = 0, action = 0, wait_for_udev = 0, uev_wait_tick = 0,
  pgfailback = -1, failback_tick = 0, rr_weight = 1, nr_active = 1,
  no_path_retry = 0, retry_tick = 0, disable_queueing = 0, minio = 1,
  flush_on_last_del = 1, attribute_flags = 0, fast_io_fail = 5,
  retain_hwhandler = 2, deferred_remove = 1, delay_watch_checks = -1,
  delay_wait_checks = -1, marginal_path_err_sample_time = -1,
  marginal_path_err_rate_threshold = -1,
  marginal_path_err_recheck_gap_time = -1,
  marginal_path_double_failed_time = -1, skip_kpartx = 1, max_sectors_kb = 0,
  force_readonly = 0, force_udev_reload = 0, needs_paths_uevent = 0,
  ghost_delay = -1, ghost_delay_tick = 0, dev_loss = 0, uid = 0, gid = 0,
  mode = 0, size = 2097152, paths = 0x0, pg = 0x55a07fafbb90, dmi = 0x0,
  alias = 0x55a07fade4d0 "mpatha", alias_prefix = 0x7f5fc8886b4a "mpath",
  selector = 0x55a07fade4b0 "service-time 0", features = 0x55a07fac24b0 "0",
  hwhandler = 0x55a07fade510 "1 alua", mpe = 0x0, hwe = 0x55a07faec5a0,
  waiter = 0, stat_switchgroup = 0, stat_path_failures = 0, stat_map_loads = 0,
  stat_total_queueing_time = 0, stat_queueing_timeouts = 0,
  stat_map_failures = 0, mpcontext = 0x0, prkey_source = 0, reservation_key = {
    _v = 0}, sa_flags = 0 '\000', prflag = 0 '\000', all_tg_pt = 0,
  generic_mp = {ops = 0x7f5fc8897a40 <dm_gen_multipath_ops>}}
(gdb) p *cmpp
$10 = {
  wwid = "36001405ef6a7bc355084b3abcb236a4c\000\063\066a4c", '\000' <repeats 88 times>,
  alias_old = '\000' <repeats 127 times>, pgpolicy = 0, pgpolicyfn = 0x0,
  nextpg = 0, bestpg = 1, queuedio = 0, action = 0, wait_for_udev = 0,
  uev_wait_tick = 0, pgfailback = 0, failback_tick = 0, rr_weight = 0,
  nr_active = 0, no_path_retry = 0, retry_tick = 0, disable_queueing = 0,
  minio = 0, flush_on_last_del = 0, attribute_flags = 0, fast_io_fail = 0,
  retain_hwhandler = 0, deferred_remove = 0, delay_watch_checks = 0,
  delay_wait_checks = 0, marginal_path_err_sample_time = 0,
  marginal_path_err_rate_threshold = 0, marginal_path_err_recheck_gap_time = 0,
  marginal_path_double_failed_time = 0, skip_kpartx = 0, max_sectors_kb = 0,
  force_readonly = 0, force_udev_reload = 0, needs_paths_uevent = 0,
  ghost_delay = 0, ghost_delay_tick = 0, dev_loss = 0, uid = 0, gid = 0,
  mode = 0, size = 2097152, paths = 0x0, pg = 0x0, dmi = 0x55a07fb0d5f0,
  alias = 0x55a07fafc490 "mpatha", alias_prefix = 0x0, selector = 0x0,
  features = 0x0, hwhandler = 0x0, mpe = 0x0, hwe = 0x0, waiter = 0,
  stat_switchgroup = 0, stat_path_failures = 0, stat_map_loads = 0,
  stat_total_queueing_time = 0, stat_queueing_timeouts = 0,
  stat_map_failures = 0, mpcontext = 0x0, prkey_source = 0, reservation_key = {
    _v = 0}, sa_flags = 0 '\000', prflag = 0 '\000', all_tg_pt = 0,
  generic_mp = {ops = 0x7f5fc8897a40 <dm_gen_multipath_ops>}}

> int disassemble_map()
> {
> ...
> 	p += get_word(p, &mpp->features);
> 
> 	if (!mpp->features)
> 		return 1;
> 
> The same holds for mpp->hwhandler, mpp->selector, and mpp->pg (not sure
> what you refer to with "and so on").
> 
> In this case the map also wouldn't have paths, and shouldn't have been
> added to curmp in the first place. So IMO this is caused by
> get_dm_mpvec() not checking the return value of disassemble_map().
> map_discovery() in multipathd does this better - maps for which
> update_multipath_table() fails are not added. Can you confirm that you
> see this crash only in multipath, not in multipathd?

  I have been runing 48h, this crash did not happen in mutlipathd. But I
can't confirm that just in multipath, not in multipathd.

Regards
Lixiaokeng



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

