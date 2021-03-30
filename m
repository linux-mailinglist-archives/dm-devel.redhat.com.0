Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E05C934E016
	for <lists+dm-devel@lfdr.de>; Tue, 30 Mar 2021 06:26:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617078409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wWNt2LEIM1BETjbC4z6GX+/RSWWgZcUKAcuF/gyfxFM=;
	b=OaRyG96TJjNKmaYjriE5flEA0T4N6LefdXKKhKYfc3aiPiLXxLQ5a4bi5/rgoy4Ub/SbBF
	+WZhJJ0LRFvgo2aNdvVJkcf/gdKdrDMBvAb3J7cU9550W57o1kutO81+xb1RDXFSg8/E17
	zev30HWNl2+XTif0PTRpYREVQkxkkes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-RofLKbvdPTmm5LZNKKiqVQ-1; Tue, 30 Mar 2021 00:26:46 -0400
X-MC-Unique: RofLKbvdPTmm5LZNKKiqVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC66A190A7A2;
	Tue, 30 Mar 2021 04:26:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24DE46E707;
	Tue, 30 Mar 2021 04:26:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 302114BB7C;
	Tue, 30 Mar 2021 04:26:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12U4Qa3D027516 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 00:26:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BA175C5AE; Tue, 30 Mar 2021 04:26:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B42B5C8B3;
	Tue, 30 Mar 2021 04:26:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12U4QVKT006898; 
	Mon, 29 Mar 2021 23:26:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12U4QU7J006897;
	Mon, 29 Mar 2021 23:26:30 -0500
Date: Mon, 29 Mar 2021 23:26:27 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210330042627.GO15006@octiron.msp.redhat.com>
References: <20210326212944.3136-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210326212944.3136-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH 0/7] multipath-tools: extended github CI
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 26, 2021 at 10:29:37PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,

For the set
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

 
> I've spent most of this week trying to improve the multipath-tools
> CI workflows on github. I now have CI workflows for 7 different
> distributions covering ~6 years of development, and 5 different
> architectures, running routinely on Github. While I found only one
> minor bug in multipath-tools in this process, I hope this will help
> avoiding regressions on less frequently-tested distributions in the
> future. Please read the commit message of the patch "github workflows: 
> add containerized / multi-arch tests" for the details.
> 
> You can see this in action on https://github.com/openSUSE/multipath-tools/actions.
> The patch set is included in the "tip" branch.
> 
> What we need now is more unit tests; our code coverage is still
> pretty pathetic.
> 
> LOC-wise, the bulk of this patch set are libdmmp man pages. These are
> almost 100% static. Including them in git allows us to get rid of perl
> as a build-time requirement, which will allow me (in the future) to
> reduce the size of the build container images significantly.
> 
> Regards
> Martin
> 
> Martin Wilck (7):
>   multipath-tools Makefiles: make pkg-config configurable
>   multipath-tools Makefiles: allow building test programs only
>   github workflows: add containerized / multi-arch tests
>   libdmmp: allow building without perl
>   multipath-tools Makefile: build before install
>   fixup "multipath-tools tests: check if /sys/dev/block is non-empty"
>   libmultipath: fix warning with clang 3.5
> 
>  .github/workflows/build-and-unittest.yaml     |  4 +-
>  .github/workflows/foreign.yaml                | 65 +++++++++++++++++++
>  .github/workflows/native.yaml                 | 31 +++++++++
>  Makefile                                      |  9 ++-
>  Makefile.inc                                  |  6 +-
>  libdmmp/Makefile                              | 41 +++++-------
>  libdmmp/docs/man/dmmp_context_free.3          | 15 +++++
>  libdmmp/docs/man/dmmp_context_log_func_set.3  | 21 ++++++
>  .../docs/man/dmmp_context_log_priority_get.3  | 23 +++++++
>  .../docs/man/dmmp_context_log_priority_set.3  | 29 +++++++++
>  libdmmp/docs/man/dmmp_context_new.3           | 19 ++++++
>  libdmmp/docs/man/dmmp_context_timeout_get.3   | 15 +++++
>  libdmmp/docs/man/dmmp_context_timeout_set.3   | 19 ++++++
>  libdmmp/docs/man/dmmp_context_userdata_get.3  | 15 +++++
>  libdmmp/docs/man/dmmp_context_userdata_set.3  | 18 +++++
>  libdmmp/docs/man/dmmp_flush_mpath.3           | 36 ++++++++++
>  libdmmp/docs/man/dmmp_last_error_msg.3        | 16 +++++
>  libdmmp/docs/man/dmmp_log_priority_str.3      | 24 +++++++
>  libdmmp/docs/man/dmmp_mpath_array_free.3      | 18 +++++
>  libdmmp/docs/man/dmmp_mpath_array_get.3       | 36 ++++++++++
>  libdmmp/docs/man/dmmp_mpath_kdev_name_get.3   | 17 +++++
>  libdmmp/docs/man/dmmp_mpath_name_get.3        | 18 +++++
>  libdmmp/docs/man/dmmp_mpath_wwid_get.3        | 13 ++++
>  libdmmp/docs/man/dmmp_path_array_get.3        | 25 +++++++
>  libdmmp/docs/man/dmmp_path_blk_name_get.3     | 17 +++++
>  libdmmp/docs/man/dmmp_path_group_array_get.3  | 27 ++++++++
>  libdmmp/docs/man/dmmp_path_group_id_get.3     | 18 +++++
>  .../docs/man/dmmp_path_group_priority_get.3   | 16 +++++
>  .../docs/man/dmmp_path_group_selector_get.3   | 16 +++++
>  libdmmp/docs/man/dmmp_path_group_status_get.3 | 23 +++++++
>  libdmmp/docs/man/dmmp_path_group_status_str.3 | 26 ++++++++
>  libdmmp/docs/man/dmmp_path_status_get.3       | 54 +++++++++++++++
>  libdmmp/docs/man/dmmp_path_status_str.3       | 34 ++++++++++
>  libdmmp/docs/man/dmmp_reconfig.3              | 27 ++++++++
>  libdmmp/docs/man/dmmp_strerror.3              | 33 ++++++++++
>  libdmmp/docs/{ => man}/libdmmp.h.3            |  0
>  libmultipath/io_err_stat.c                    |  2 +-
>  tests/Makefile                                |  1 +
>  tests/devt.c                                  |  2 +-
>  39 files changed, 797 insertions(+), 32 deletions(-)
>  create mode 100644 .github/workflows/foreign.yaml
>  create mode 100644 .github/workflows/native.yaml
>  create mode 100644 libdmmp/docs/man/dmmp_context_free.3
>  create mode 100644 libdmmp/docs/man/dmmp_context_log_func_set.3
>  create mode 100644 libdmmp/docs/man/dmmp_context_log_priority_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_context_log_priority_set.3
>  create mode 100644 libdmmp/docs/man/dmmp_context_new.3
>  create mode 100644 libdmmp/docs/man/dmmp_context_timeout_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_context_timeout_set.3
>  create mode 100644 libdmmp/docs/man/dmmp_context_userdata_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_context_userdata_set.3
>  create mode 100644 libdmmp/docs/man/dmmp_flush_mpath.3
>  create mode 100644 libdmmp/docs/man/dmmp_last_error_msg.3
>  create mode 100644 libdmmp/docs/man/dmmp_log_priority_str.3
>  create mode 100644 libdmmp/docs/man/dmmp_mpath_array_free.3
>  create mode 100644 libdmmp/docs/man/dmmp_mpath_array_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_mpath_kdev_name_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_mpath_name_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_mpath_wwid_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_array_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_blk_name_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_group_array_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_group_id_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_group_priority_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_group_selector_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_group_status_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_group_status_str.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_status_get.3
>  create mode 100644 libdmmp/docs/man/dmmp_path_status_str.3
>  create mode 100644 libdmmp/docs/man/dmmp_reconfig.3
>  create mode 100644 libdmmp/docs/man/dmmp_strerror.3
>  rename libdmmp/docs/{ => man}/libdmmp.h.3 (100%)
> 
> -- 
> 2.30.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

