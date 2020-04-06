Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA5219FDC4
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 20:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586199592;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hQEAPHdgikGGQwncVuxwS6h+GggQUES5cbaqMscFLmQ=;
	b=EAKAVtwndzlgL0tzf6RYaca9ZfK/9uacXubb49SZKeRCMdJ1Fu3i0U6rZGLp8fWLZe7bmt
	7EnhIjXLIb6pwGxcXIsBOSLJWOEYFPItf2EWQVPB2O1XnhWvci8wnq09dFZ7bpEvkVPDHh
	4+STEFu1kSM+Zhu3482Mh1/yxurs160=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-mNvEvx1ZPy-oqWStiSr9LA-1; Mon, 06 Apr 2020 14:59:49 -0400
X-MC-Unique: mNvEvx1ZPy-oqWStiSr9LA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1EC61005F79;
	Mon,  6 Apr 2020 18:59:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8953E5E010;
	Mon,  6 Apr 2020 18:59:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CE2D180880D;
	Mon,  6 Apr 2020 18:59:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036IxIx4005976 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 14:59:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD8CC2166B2D; Mon,  6 Apr 2020 18:59:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9FE72166B29
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 18:59:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F009800298
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 18:59:16 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-315-x7BDXSAuOVKGaf2-ePizEQ-1;
	Mon, 06 Apr 2020 14:59:11 -0400
X-MC-Unique: x7BDXSAuOVKGaf2-ePizEQ-1
Received: by linux.microsoft.com (Postfix, from userid 1033)
	id 6557920B4737; Mon,  6 Apr 2020 11:59:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6557920B4737
Date: Mon, 6 Apr 2020 11:59:10 -0700
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: Jann Horn <jannh@google.com>
Message-ID: <20200406185910.GA77950@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20200406181045.1024164-1-deven.desai@linux.microsoft.com>
	<CAG48ez3JV-tzjRLdcys6Fz9LKYaB1h-1GaeAzkUYtY1RgxsB6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAG48ez3JV-tzjRLdcys6Fz9LKYaB1h-1GaeAzkUYtY1RgxsB6g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036IxIx4005976
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
	dm-devel@redhat.com, snitzer@redhat.com,
	Pavel Tatashin <pasha.tatashin@soleen.com>,
	James Morris <jmorris@namei.org>,
	Mimi Zohar <zohar@linux.ibm.com>, mdsakib@linux.microsoft.com,
	linux-block@vger.kernel.org, nramas@linux.microsoft.com,
	linux-security-module <linux-security-module@vger.kernel.org>,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com, agk@redhat.com,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [dm-devel] [RESEND PATCH 00/11] Integrity Policy Enforcement
	LSM (IPE)
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 06, 2020 at 08:50:46PM +0200, Jann Horn wrote:
> On Mon, Apr 6, 2020 at 8:10 PM <deven.desai@linux.microsoft.com> wrote:
> > Overview:
> > ------------------------------------
> > IPE is a Linux Security Module, which allows for a configurable
> > policy to enforce integrity requirements on the whole system. It
> > attempts to solve the issue of Code Integrity: that any code being
> > executed (or files being read), are identical to the version that
> > was built by a trusted source.
> 
> Where's patch 02/11? lore at
> https://lore.kernel.org/linux-security-module/20200406183619.GA77626@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net/T/#t
> has everything other than that patch.

It looks like it's over majordomo's character limit by 7489 characters.
I'll have to repost with this patch broken up. Apologies.

- Deven


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

