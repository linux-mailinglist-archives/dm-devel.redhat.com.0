Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E100E253774
	for <lists+dm-devel@lfdr.de>; Wed, 26 Aug 2020 20:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598467627;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SSyzG1eJXLZqYZjmC+ZVgQdfEWXp/vIxWLGc3M09f3Y=;
	b=e8wmz6d138Iy69B3UIAbTZwKfI9mtZGoeqMroeZCbtB6sj3YOlTjZPrq5qicdoN/uosW21
	XWVHfjHHFV6bEtodNJ1Eps6ig5LrRT06I3NnYctRMHte2Pz8kv1hU96GvubZ9iDhslVZSi
	gf0fJNKK746OtMzR5f13piChopTxPTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-ngnnm2v_NwaMCKnI3z6imA-1; Wed, 26 Aug 2020 14:47:05 -0400
X-MC-Unique: ngnnm2v_NwaMCKnI3z6imA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 810A11DDFC;
	Wed, 26 Aug 2020 18:46:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AEB87A433;
	Wed, 26 Aug 2020 18:46:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78291181A869;
	Wed, 26 Aug 2020 18:46:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QIkZFY005212 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 14:46:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB5447A423; Wed, 26 Aug 2020 18:46:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF78E71D35;
	Wed, 26 Aug 2020 18:46:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07QIkVJv024979; 
	Wed, 26 Aug 2020 13:46:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07QIkUvf024978;
	Wed, 26 Aug 2020 13:46:30 -0500
Date: Wed, 26 Aug 2020 13:46:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200826184630.GB19233@octiron.msp.redhat.com>
References: <20200826095907.5576-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200826095907.5576-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 00/10] multipath-tools: valgrind tests &
	fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 26, 2020 at 11:58:57AM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe and Ben,
> 
> this series  adds a make target to run unit tests under valgrind, and fixes
> the issues I found using this test target.
> 
> It contains the patches I sent yesterday ([PATCH 1/5] multipath-tools tests:
> fix memory leak in alias test), but in a different order / numbering,
> which seems more appropriate now.
> 

For the set
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> Regards,
> Martin
> 
> Martin Wilck (10):
>   multipath-tools: Makefile.inc: fix compilation with gcc 4.x
>   multipath-tools: Makefile: add "valgrind-test" target
>   multipath-tools tests: fix memory leak in alias test
>   multipath-tools tests: fix memory leak in hwtable test
>   multipath-tools tests: fix memory leak in vpd test
>   libmultipath: fix memory leak in ble handlers
>   libmultipath: fix enable_foreign memory leak
>   libmultipath: fix invalid memory access in is_token()
>   libmultipath: alloc_strvec: NULL-initialize strvec elements
>   libmultipath: validate_config_strvec(): avoid out-of-bounds access
> 
>  Makefile              |  3 +++
>  Makefile.inc          |  2 +-
>  libmultipath/config.c |  2 ++
>  libmultipath/dict.c   | 12 +++++++++---
>  libmultipath/parser.c | 17 +++++++++++------
>  multipath/main.c      |  2 +-
>  tests/Makefile        | 13 +++++++++++--
>  tests/README.md       |  8 ++++++++
>  tests/alias.c         |  2 ++
>  tests/hwtable.c       |  4 ++++
>  tests/vpd.c           | 18 ++++++++----------
>  11 files changed, 60 insertions(+), 23 deletions(-)
> 
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

