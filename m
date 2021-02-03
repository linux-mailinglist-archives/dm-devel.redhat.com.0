Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB8730DFC0
	for <lists+dm-devel@lfdr.de>; Wed,  3 Feb 2021 17:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612369862;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IQ0sfKjlVw+X13FwPWCtKTybHAb55UNtnrOCWeNWVSA=;
	b=BNv+Di6L60pXI2MORxcttx8xIVcc4aaCzgQD7Ccob9kgA/5AT6AmMxa0PI0UjRI8V65H/m
	DOGq7HcwQEnXbwTgIL4NQL/ywFKEorlK1lVKmMbqLmea84GnNZ0epo4j4vV5JdYITettww
	7ADOg9OShDDuZbGY3uluSwnu2hQxjAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-6GYKH-WoMQWPqB---dhmsQ-1; Wed, 03 Feb 2021 11:30:59 -0500
X-MC-Unique: 6GYKH-WoMQWPqB---dhmsQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7191679EC1;
	Wed,  3 Feb 2021 16:30:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5FF26085A;
	Wed,  3 Feb 2021 16:30:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB39257DFA;
	Wed,  3 Feb 2021 16:30:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 113GUdlC016030 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Feb 2021 11:30:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B88DC10016F4; Wed,  3 Feb 2021 16:30:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A774C10013D7;
	Wed,  3 Feb 2021 16:30:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 113GUZGp020082; 
	Wed, 3 Feb 2021 10:30:35 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 113GUXLr020081;
	Wed, 3 Feb 2021 10:30:33 -0600
Date: Wed, 3 Feb 2021 10:30:33 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210203163033.GY15006@octiron.msp.redhat.com>
References: <20210202212729.18442-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210202212729.18442-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/3] consistent behavior of filter_property()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 02, 2021 at 10:27:26PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This is a spring-off of the previous discussion under the subject
> "libmultipath: fix NULL dereference in get_be64".
> 
> Repeating part of the text of my last post there:
> 
> pp->uid_attribute may be set from the hwtable, which
> means that vendor/product must be known, which in turn means that
> uid_attribute can't be set correctly before sysfs_pathinfo() is run.
> Thus, in order to be consistent, we need to move the filter_property()
> further down in pathinfo(), after the call to sysfs_pathinfo(). 
> 
> However, that has a side effect. As Ben already stated,
> pp->uid_attribute currently is *never* set the first time the call
> chain pathinfo()->filter_property() is run. After the proposed change,
> it would *always* be set in this call chain, possibly leading to more
> cases where pathinfo returns PATHINFO_SKIPPED.
> 
> This matters e.g. for "multipath -w". When we remove a WWID, we must
> be sure get_refwwid() fills in the wwid, which won't happen if
> PATHINFO_SKIPPED is returned.
> 
> (While looking at this, I discovered that it didn't work in current
> upstream either. I guess it has been broken since 0.6.0, or
> 355291b ("libmultipath: filter for missing property in get_refwwid()"
> This lead to the addition of patch 3/3).
> 
> In order not to break such use cases, we need to make the
> filter_property() test in pathinfo() dependent on DI_BLACKLIST. That
> would make a lot of sense, but it'd cause a semantic change.
> 
> Comments welcome.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

For the set.
> 
> Regards
> Martin
> 
> 
> Martin Wilck (3):
>   pathinfo: call filter_property() after sysfs_pathinfo()
>   libmultipath: pathinfo: call filter_property only with DI_BLACKLIST
>   multipath -w: allow removing blacklisted paths
> 
>  libmultipath/configure.c |  4 +-
>  libmultipath/discovery.c | 19 +++++++--
>  libmultipath/valid.c     |  4 --
>  tests/Makefile           |  2 +-
>  tests/test-lib.c         | 18 ++++----
>  tests/valid.c            | 91 ++++++++++++++++++++++++++++++++++++----
>  6 files changed, 111 insertions(+), 27 deletions(-)
> 
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

