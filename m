Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6B251CB53
	for <lists+dm-devel@lfdr.de>; Thu,  5 May 2022 23:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651786611;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sevX75uHmGmSOZVzPncsJZGb6mvy5OPmsGwCvcgJZcU=;
	b=S1+JeHADc57nM9G+3WmYNXT1vmkUXWsNu1nzdQ+iqE5KCsIcWew3GaF77Hv882Ha3xIPoF
	y5abZ0Uo9Vo+xmT+C2dJ4Th5Nyin7QUhTgTgMwluwzB+cHfd0zEO6xr/T8GjdXYjETBNv5
	4PQdAaduIXxYIe/H6PZcS+AKYWcaZK4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-0aqVEUBLNPqj7MauKSEg0g-1; Thu, 05 May 2022 17:36:50 -0400
X-MC-Unique: 0aqVEUBLNPqj7MauKSEg0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7AC738107A0;
	Thu,  5 May 2022 21:36:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BFE11521604;
	Thu,  5 May 2022 21:36:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9238D1947B80;
	Thu,  5 May 2022 21:36:37 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9DB11947047
 for <dm-devel@listman.corp.redhat.com>; Thu,  5 May 2022 21:36:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 84DF02166B1A; Thu,  5 May 2022 21:36:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F6B32166B17;
 Thu,  5 May 2022 21:36:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 245LaUSi005597;
 Thu, 5 May 2022 16:36:30 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 245LaUse005596;
 Thu, 5 May 2022 16:36:30 -0500
Date: Thu, 5 May 2022 16:36:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220505213629.GV24684@octiron.msp.redhat.com>
References: <20220503220646.16925-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220503220646.16925-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH 0/7] multipath-tools: fix unit test breakage
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
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 04, 2022 at 12:06:39AM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> The previous patches 
> 
> af15832 multipath-tools: make multipath_dir a compiled-in option
> 1fc7c4d multipath-tools: make config_dir a compiled-in option
> 21b3d6b multipath-tools: stop supporting getuid_callout
> 
> have caused breakage in the unit tests. Not so much because they'd
> actually break the tests, but because they broke the compilation and
> the search paths for the configuration files (for the former two commits)
> and because the hwtable test relied on being able to the retrieve
> the now removed "getuid_callout" property from config files.
> 
> Fix it. As always, comments welcome.

For the set,
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> Regards
> Martin
> 
> Martin Wilck (7):
>   multipath-tools: enable local configdir and plugindir for unit tests
>   tests/mpathvalid: fix check for DEFAULT_CONFIG_FILE
>   multipath-tools tests: hwtable: adapt after removal of getuid
>   tests/hwtable: fix test_regex_2_strings_hwe_dir
>   libmultipath: fix valgrind_test
>   tests/Makefile: make TESTDIR configurable
>   github workflows: foreign.yaml: fix config dir in run environment
> 
>  .github/workflows/foreign.yaml |   7 +-
>  libmultipath/Makefile          |  24 ++++--
>  libmultipath/config.c          |   3 +
>  tests/Makefile                 |  12 ++-
>  tests/hwtable.c                | 151 ++++++++++++++++-----------------
>  tests/mpathvalid.c             |   2 +-
>  tests/test-lib.c               |  89 ++++++++++++++-----
>  tests/test-lib.h               |   2 +-
>  8 files changed, 180 insertions(+), 110 deletions(-)
> 
> -- 
> 2.36.0
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

