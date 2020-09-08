Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 138EF260D45
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 10:16:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-Pu9a8rbHMLGtzsxjkFBUnA-1; Tue, 08 Sep 2020 04:16:18 -0400
X-MC-Unique: Pu9a8rbHMLGtzsxjkFBUnA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BE301007469;
	Tue,  8 Sep 2020 08:16:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 840AA702E7;
	Tue,  8 Sep 2020 08:16:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEFED79FFA;
	Tue,  8 Sep 2020 08:15:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0888Fi01013324 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 04:15:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB2FF201828C; Tue,  8 Sep 2020 08:15:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5B322026F94
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:15:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 580B6906389
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:15:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-337-sUG6t-xmO_SjwSJ75cduGQ-1;
	Tue, 08 Sep 2020 04:15:38 -0400
X-MC-Unique: sUG6t-xmO_SjwSJ75cduGQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2346DACF2;
	Tue,  8 Sep 2020 08:15:38 +0000 (UTC)
Message-ID: <3878396a72f62bc724766d1a5f752c490b60c50d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 08 Sep 2020 10:15:36 +0200
In-Reply-To: <a3672ace-9637-20e2-04ce-857e364ffdb3@huawei.com>
References: <a3672ace-9637-20e2-04ce-857e364ffdb3@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V2 00/14] multipath-tools series: some
 cleanups and fixes checked by codedex tool
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello lixiaokeng,

On Tue, 2020-09-08 at 14:50 +0800, lixiaokeng wrote:
> Patches 01, 02, 04, 05, 06, 09, 11, 12, 14 have some changes.

I have problems applying your patches. It seems to me that the
whitespace has been messed up by your mail program (tab indentation has
been replaced by spaces).

The v1 series you sent was OK, but v2 is different.

Regards,
Martin


> 
> Changes in V2:
> - patch 01: set major and minor to -1 at begining, as suggested
>   by Martin Wilck
> - patch 02: chanege malloc to calloc to calloc, as suggested by
>   Martin Wilck
> - patch 04: delete seting ret when jump to out, as suggested by
>   Martin Wilck
> - patch 05: turn back MALLOC to malloc and reomve error message,
>   as suggested by Martin Wilck
> - patch 06: change malloc to xmalloc, as suggested by Martin Wilck
> - patch 09: use ?: instead of checking mp->features, as suggested
>   by Benjamin Marzinski
> - patch 11: change num_transport to num_transportids to combine them,
>   as suggested by Benjamin Marzinski
> - patch 12: delete continue and add remove_map, as suggested by
>   Martin Wilck
> - patch 14: modify patch because of patch 11 "mpathpersist: check
>   whether malloc paramp->trnptid_list fails in handle_args func"
>   changing
> 
> Zhiqiang Liu (7):
>   multipathd: use MALLOC and check return value in cli_getprkey func
>   kpartx: check return value of malloc in main func
>   libmultipath: check return value of dm_mapname in
> sysfs_check_holders
>   libmultipath: donot free *dst if REALLOC fails in merge_words
>   libmultipath: check whether mp->features is NUll in assemble_map
>   util/tests: use assert_non_null to ensure malloc returns non-null
>     pointer
>   mpathpersist: check whether malloc paramp->trnptid_list fails in
>     handle_args func
> 
> lixiaokeng (7):
>   multipathd: initialize major and minor in cli_add_map
>   libmultipath: change malloc to calloc in print_foreign_topology
>   libmultipath: use map instead of dm_task_get_name
>   multipathd: check MALLOC return value in mpath_pr_event_handler_fn
>   libmultipathpersist: use update_multipath_table/status in get_mpvec
>   multipath: use update_multipath_table/status in check_useable_paths
>   multipathpersist: delete unused variable in handle_args
> 
>  kpartx/kpartx.c                 |  5 ++-
>  libmpathpersist/mpath_persist.c | 15 +++-----
>  libmultipath/devmapper.c        |  2 +-
>  libmultipath/dmparser.c         | 17 +++------
>  libmultipath/foreign.c          |  4 +-
>  libmultipath/sysfs.c            |  6 ++-
>  mpathpersist/main.c             | 66 +++++++++++++++++++++++++----
> ----
>  multipath/main.c                |  9 ++---
>  multipathd/cli_handlers.c       |  4 +-
>  multipathd/main.c               |  8 ++--
>  tests/util.c                    |  2 +
>  11 files changed, 86 insertions(+), 52 deletions(-)
> 
> --
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

