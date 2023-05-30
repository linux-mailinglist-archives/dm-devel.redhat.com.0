Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9D87171A7
	for <lists+dm-devel@lfdr.de>; Wed, 31 May 2023 01:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685489361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gCP3zmLtpDsD444i2rDNJwdwcjoAdhEPbMGy3n+j/dU=;
	b=Q3NmKny3xcagZVwlQmkT8blFYAUZZzkc+wwJB1Sw8RfKkJXyKLZCcAN5H9ZhDD2OqSTrM2
	+SkNwf15CttRGZgem8RST5WtUM2AHuvec+IaaYkVOE/uvhHfmMZeEDbu4RwLdXnUD6f+9Y
	PaBvXvGbwaHVN+SODT1AYVHa1foX6hg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-oMXHg3wfOGiBpMo1BeNeNQ-1; Tue, 30 May 2023 19:29:18 -0400
X-MC-Unique: oMXHg3wfOGiBpMo1BeNeNQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9504A1C05EAE;
	Tue, 30 May 2023 23:29:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17A0F112132C;
	Tue, 30 May 2023 23:29:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BF22A19465B7;
	Tue, 30 May 2023 23:29:12 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A69031946595
 for <dm-devel@listman.corp.redhat.com>; Tue, 30 May 2023 23:29:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 59ADE202696C; Tue, 30 May 2023 23:29:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 522E220296C6
 for <dm-devel@redhat.com>; Tue, 30 May 2023 23:29:11 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38693811E78
 for <dm-devel@redhat.com>; Tue, 30 May 2023 23:29:11 +0000 (UTC)
Received: from out-53.mta0.migadu.com (out-53.mta0.migadu.com
 [91.218.175.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-35wBTf32NQWExj4PIoMdbw-1; Tue, 30 May 2023 19:29:08 -0400
X-MC-Unique: 35wBTf32NQWExj4PIoMdbw-1
Date: Tue, 30 May 2023 19:29:00 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <ZHaGvAvFB3wWPY17@moria.home.lan>
References: <alpine.LRH.2.21.2305260915400.12513@file01.intranet.prod.int.rdu2.redhat.com>
 <ZHUcmeYrUmtytdDU@moria.home.lan>
 <alpine.LRH.2.21.2305300809350.13307@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.2305300809350.13307@file01.intranet.prod.int.rdu2.redhat.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] fuzzing bcachefs with dm-flakey
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
Cc: linux-fsdevel@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 30, 2023 at 05:00:39PM -0400, Mikulas Patocka wrote:
> I'd like to know how do you want to do coverage analysis? By instrumenting 
> each branch and creating a test case that tests that the branch goes both 
> ways?

Documentation/dev-tools/gcov.rst. The compiler instruments each branch
and then the results are available in debugfs, then the lcov tool
produces annotated source code as html output.

> I know that people who write spacecraft-grade software do such tests, but 
> I can't quite imagine how would that work in a filesystem.
> 
> "grep -w if fs/bcachefs/*.[ch] | wc -l" shows that there are 5828 
> conditions. That's one condition for every 15.5 lines.

Most of which are covered by existing tests - but by running the
existing tests with code coverage analylis we can see which branches the
tests aren't hitting, and then we add fault injection points for those.

With fault injection we can improve test coverage a lot without needing
to write any new tests (or simple ones, for e.g. init/mount errors) 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

