Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5E497184E05
	for <lists+dm-devel@lfdr.de>; Fri, 13 Mar 2020 18:53:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584122007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AZoAJKUKU7PSXlXt5ZQovur/GctX0qJHoL92K+/YlIA=;
	b=HH2gwyXYM3iOHJzhSMyF0nphUyuBKALUj6rO3f+iLb3uFd82BWoVteeTJI/ytuxL8owJ79
	ByNrbQA3fzca20P51rD3MmfV+PYzy6CMcZwlhpsSPqEcV1uGYNUrNux4ekQUJy5mzk5uWp
	g2dq0P9oIjzTGL8bizKvepsxVgHAQYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-x8ajjOz6O9ORnagETY9vLQ-1; Fri, 13 Mar 2020 13:53:02 -0400
X-MC-Unique: x8ajjOz6O9ORnagETY9vLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 665498018A4;
	Fri, 13 Mar 2020 17:52:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 945EA1001B28;
	Fri, 13 Mar 2020 17:52:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4853585ECD;
	Fri, 13 Mar 2020 17:52:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02DHqnuW013421 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Mar 2020 13:52:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0066092D0C; Fri, 13 Mar 2020 17:52:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E38194940;
	Fri, 13 Mar 2020 17:52:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02DHqiHI017984; 
	Fri, 13 Mar 2020 12:52:44 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02DHqi4D017983;
	Fri, 13 Mar 2020 12:52:44 -0500
Date: Fri, 13 Mar 2020 12:52:43 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200313175243.GQ30153@octiron.msp.redhat.com>
References: <20200302222025.21022-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200302222025.21022-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/4] multipath-tools unit test fixups
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Mar 02, 2020 at 11:20:21PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> as announced in my previous post, here's a set of minor fixups for the
> unit tests. The README.md should have been created long ago. My main
> issue is that I'd prefer not to have a file under git control that is
> likely to be customized in every developer's environment and needs
> to be stashed away before every serious git work.
> 
> Martin Wilck (4):
>   Remove tests/directio_test_dev
>   tests/Makefile: allow setting DIO_TEST_DEV in the environment
>   tests/Makefile: add test_clean target
>   tests: add README.md

Sorry for the delay. ACK for the set.

-Ben


> 
>  tests/Makefile          | 13 +++++---
>  tests/README.md         | 72 +++++++++++++++++++++++++++++++++++++++++
>  tests/directio_test_dev |  4 ---
>  3 files changed, 81 insertions(+), 8 deletions(-)
>  create mode 100644 tests/README.md
>  delete mode 100644 tests/directio_test_dev
> 
> -- 
> 2.25.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

