Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDBD294EA3
	for <lists+dm-devel@lfdr.de>; Wed, 21 Oct 2020 16:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603290389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FyNEq4pOrQwJaCGJKgTm8k4mSVkmMh68M4XoYCVhX84=;
	b=ZGPwR6NtQVq1M8EjFAQ2nVicV0qlfqWJMLlP4nrRay20OzHWi1eQqn1awIsTUF/INYex+F
	E2YcvCLgw/uw5H7CY6h/MxT705gwQkhsvZ/do2NHXigi1nsqWSPehUgcpHtXMdWIiKIKyT
	/iNZi8zk77xXmYRJQ2ShcaTqmFeG0S8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-ysLPZMcqMZ6hOKYx9HrVmA-1; Wed, 21 Oct 2020 10:26:26 -0400
X-MC-Unique: ysLPZMcqMZ6hOKYx9HrVmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC40118C520D;
	Wed, 21 Oct 2020 14:26:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA6B55DA81;
	Wed, 21 Oct 2020 14:26:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 400F48C7D6;
	Wed, 21 Oct 2020 14:26:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09LEOObe024386 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Oct 2020 10:24:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F500200E21A; Wed, 21 Oct 2020 14:24:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A9B72023598
	for <dm-devel@redhat.com>; Wed, 21 Oct 2020 14:24:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E79DF801779
	for <dm-devel@redhat.com>; Wed, 21 Oct 2020 14:24:21 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-407-luuBAlqxMpyFODQWn0TuEA-1; Wed, 21 Oct 2020 10:24:19 -0400
X-MC-Unique: luuBAlqxMpyFODQWn0TuEA-1
Received: by mail-pf1-f194.google.com with SMTP id e10so1588741pfj.1
	for <dm-devel@redhat.com>; Wed, 21 Oct 2020 07:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kd24n8fvExqkMZoTQn7ZLbjiXdKLPg+Z9WhqJAOkLno=;
	b=Zk7bzC3KSOX0gKzxZHdu0TUz1FBGHD3f+Vnf8qSlvNgoBv3L3MtCCmNc+RkVoowZZJ
	0Pf31JQPmau+8rCLMjfM3+jwG9PoXv8daJvuovKgAgND8Nt3kJw7asecKob1iHTi3ak1
	MS11QBD0CMogHqGRyTAm+yV+zAx//uIJ63Dd46vX45MPwX4QlEbK7s0Zh59PVWexHMcK
	QZF+276Wc/ThaEHegyzaJ7hBvxo+bgGR5ZP4PZGK/ENQ5+kBVbRPKUgLJ8+PSLx5Kgfa
	1NfYQA06AScBDihpgpOlYS7MANddRHj1jLycGZSSVZL6IDp/qcXBkgj3mgDa2vjDCsj1
	pIig==
X-Gm-Message-State: AOAM5327j73Li96KtR9r7NYaA87XX74STL1shkpJUtynLAt5RKbTccKx
	POh7Li4kkez+8+D2f5cAaHACcW8ArOb3QYZjwjA=
X-Google-Smtp-Source: ABdhPJzzUagLy2/wTR2reR/iEjOUzGDitwgsUDsCMI6OUJ3VjWJ4T7EinTswEywdjKJZfSeH/cpZeoxXijk2LTN0EIQ=
X-Received: by 2002:a63:a546:: with SMTP id r6mr3613847pgu.160.1603290258598; 
	Wed, 21 Oct 2020 07:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201012162736.65241-1-nmeeramohide@micron.com>
	<20201015080254.GA31136@infradead.org>
	<SN6PR08MB420880574E0705BBC80EC1A3B3030@SN6PR08MB4208.namprd08.prod.outlook.com>
	<CAPcyv4j7a0gq++rL--2W33fL4+S0asYjYkvfBfs+hY+3J=c_GA@mail.gmail.com>
In-Reply-To: <CAPcyv4j7a0gq++rL--2W33fL4+S0asYjYkvfBfs+hY+3J=c_GA@mail.gmail.com>
From: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 21 Oct 2020 10:24:05 -0400
Message-ID: <CAMM=eLf+2VYHB6vZVjn_=GA5uXJWKL-d6PuCpHEBPz=_Loe58A@mail.gmail.com>
To: Dan Williams <dan.j.williams@intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"Steve Moyer \(smoyer\)" <smoyer@micron.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	"John Groves \(jgroves\)" <jgroves@micron.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	device-mapper development <dm-devel@redhat.com>,
	"Nabeel Meeramohideen Mohamed \(nmeeramohide\)" <nmeeramohide@micron.com>,
	"Pierre Labat \(plabat\)" <plabat@micron.com>,
	"Greg Becker \(gbecker\)" <gbecker@micron.com>
Subject: Re: [dm-devel] [EXT] Re: [PATCH v2 00/22] add Object Storage Media
	Pool (mpool)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Dan,

On Fri, Oct 16, 2020 at 6:38 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Fri, Oct 16, 2020 at 2:59 PM Nabeel Meeramohideen Mohamed
> (nmeeramohide) <nmeeramohide@micron.com> wrote:
>
> > (5) Representing an mpool as a /dev/mpool/<mpool-name> device file provides a
> > convenient mechanism for controlling access to and managing the multiple storage
> > volumes, and in the future pmem devices, that may comprise an logical mpool.
>
> Christoph and I have talked about replacing the pmem driver's
> dependence on device-mapper for pooling.

Was this discussion done publicly or private?  If public please share
a pointer to the thread.

I'd really like to understand the problem statement that is leading to
pursuing a pmem native alternative to existing DM.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

