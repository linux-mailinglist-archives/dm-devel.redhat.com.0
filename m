Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9E84084D4
	for <lists+dm-devel@lfdr.de>; Mon, 13 Sep 2021 08:40:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631515222;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2fNW4iBri5WqKXxlRaRHroTki+WJ5n6QYUq42MkWpcA=;
	b=VBVgihRmuMv+5vbH45xRliPT6VZ/aU9gajOj95A4TXVB8ejvP24L+EnZsQuwHUogIjZmTI
	V6krJ+8I2B6theVuyktzga90dDHoxxd4acVapkMi65C33wZ5fWPwN5hxSg8+3mnF34NvN/
	zzQhvBmoIyucbxqqtzxYlXTKWn/5yN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-bNAIqllgOyKRWghtp_hUHw-1; Mon, 13 Sep 2021 02:40:20 -0400
X-MC-Unique: bNAIqllgOyKRWghtp_hUHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB160108468A;
	Mon, 13 Sep 2021 06:40:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AC2B5F706;
	Mon, 13 Sep 2021 06:40:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D0761806D01;
	Mon, 13 Sep 2021 06:40:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 188FdlXp007586 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Sep 2021 11:39:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8816B77F30; Wed,  8 Sep 2021 15:39:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from x2.localnet (unknown [10.22.8.236])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4456E77F29;
	Wed,  8 Sep 2021 15:39:31 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: =?ISO-8859-1?Q?Wei=DF=2C?= Michael <michael.weiss@aisec.fraunhofer.de>,
	Richard Guy Briggs <rgb@redhat.com>
Date: Wed, 08 Sep 2021 11:39:02 -0400
Message-ID: <4344604.LvFx2qVVIh@x2>
Organization: Red Hat
In-Reply-To: <20210908131616.GK490529@madcap2.tricolour.ca>
References: <20210904095934.5033-1-michael.weiss@aisec.fraunhofer.de>
	<9ca855cb19097b6fa98f2b3419864fd8ddadf065.camel@aisec.fraunhofer.de>
	<20210908131616.GK490529@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 13 Sep 2021 02:39:51 -0400
Cc: "paul@paul-moore.com" <paul@paul-moore.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"eparis@redhat.com" <eparis@redhat.com>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"song@kernel.org" <song@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>,
	"casey@schaufler-ca.com" <casey@schaufler-ca.com>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v4 0/3] dm: audit event logging
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, September 8, 2021 9:16:16 AM EDT Richard Guy Briggs wrote:
>  Another minor oddity is the double "=" for the subj
> 
> > > field, which doesn't appear to be a bug in your code, but still
> > > puzzling.
> > 
> > In the test setup, I had Apparmor enabled and set as default security
> > module. This behavior occurs in any audit_log message.
> > Seems that this is coming from the label handling there. Having a quick
> > look at the code there is that they use '=' in the label to provide a
> > root view as part of their policy virtualization. The corresponding
> > commit is sitting there since 2017:
> > "26b7899510ae243e392960704ebdba52d05fbb13"
> 
> Interesting...  Thanks for tracking down that cause.  I don't know how
> much pain that will cause the userspace parsing tools.  I've added Steve
> Grubb to the Cc: to get his input, but this should not derail this patch
> set.

It likely breaks any parser. I would even say that it's a malformed event 
that should be corrected. There's been a published a specification for audit 
events  for at least 5 years. Latest copy is here:

https://github.com/linux-audit/audit-documentation/wiki/SPEC-Writing-Good-Events

-Steve



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

