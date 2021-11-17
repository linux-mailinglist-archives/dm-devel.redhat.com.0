Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B87454EDC
	for <lists+dm-devel@lfdr.de>; Wed, 17 Nov 2021 22:00:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637182855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mr2mHBeE4s56n61eNp9lRcOfjqWKTsjhoa4Qwymdu+Q=;
	b=Iz2NE9XbkwZaK51K6Se7eLHHVIPtkkL9q76t+4TY8Cow2PKdAIij0px1HKyl5or3kDhyHD
	Jv8gSQMjFdY6yodG9+nnQe/HjK+eorVfEDzizxiw9mFfg/CMk3Qglwg5E1MZOd11PPkEzB
	USJdqezkTnIpZHPWsfzGPMOxgixCOB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-ke7xE-ssNEaw8hSDjdb9IQ-1; Wed, 17 Nov 2021 16:00:53 -0500
X-MC-Unique: ke7xE-ssNEaw8hSDjdb9IQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9BFA100C667;
	Wed, 17 Nov 2021 21:00:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BC5310016F4;
	Wed, 17 Nov 2021 21:00:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 196694EA2A;
	Wed, 17 Nov 2021 21:00:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHKtFBm023717 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 15:55:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B6B53AEF; Wed, 17 Nov 2021 20:55:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6063826370;
	Wed, 17 Nov 2021 20:55:11 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AHKt90B004519; 
	Wed, 17 Nov 2021 14:55:09 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AHKt9Nf004518;
	Wed, 17 Nov 2021 14:55:09 -0600
Date: Wed, 17 Nov 2021 14:55:08 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211117205508.GB19591@octiron.msp.redhat.com>
References: <1637181217-4423-1-git-send-email-bmarzins@redhat.com>
	<c78729cd320b2a8dec4414c389922ec1e41ff13d.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <c78729cd320b2a8dec4414c389922ec1e41ff13d.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 0/4] Add "reconfigure all" multipath
	command
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 17, 2021 at 08:50:55PM +0000, Martin Wilck wrote:
> On Wed, 2021-11-17 at 14:33 -0600, Benjamin Marzinski wrote:
> > 
> > Changes from v1 as suggested by Martin Wilck:
> > 
> > 0001: update libmultipath.version to handle ABI change in struct
> > config
> > 0003: Clarify commit message
> 
> Did you overlook the two other comments I had on 0003, or did you
> deliberately ignore them? Just asking.

Ooops. Missed them. I'll resend.

-Ben

> 
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

