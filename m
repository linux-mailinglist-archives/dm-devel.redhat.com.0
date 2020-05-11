Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6711CE2FE
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 20:46:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589222810;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ECAXCfZa5k5bTtz3oPQndnxPHCa4YpyQ+77prKUmD24=;
	b=AhL/DIQ769XFGx1nJaFBL0yXgaMBWJGuAKPHY+K/m1HvaVbUWqZ6ghIhGAJVUEMTfl81uP
	h/eFTnVSes6LJH0eCDFEm75EsDqv8/Q1m8/BqojbqzXL1ZDDf5j9oRTDNXO5KvssAIogso
	5MSioQgFnNcfkegDVtLJYPLKUrAKbEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-cuLPJXyxMyqfmYgjENf0LQ-1; Mon, 11 May 2020 14:46:48 -0400
X-MC-Unique: cuLPJXyxMyqfmYgjENf0LQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AA0AEC1B8;
	Mon, 11 May 2020 18:46:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A480C100034E;
	Mon, 11 May 2020 18:46:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E25841809543;
	Mon, 11 May 2020 18:46:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BIkYTJ026179 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 14:46:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D5C061054FDB; Mon, 11 May 2020 18:46:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1BEE1054FDA
	for <dm-devel@redhat.com>; Mon, 11 May 2020 18:46:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1859F800655
	for <dm-devel@redhat.com>; Mon, 11 May 2020 18:46:32 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-407-TRixhjDpMQK1Bb9oQW-Frg-1; Mon, 11 May 2020 14:46:26 -0400
X-MC-Unique: TRixhjDpMQK1Bb9oQW-Frg-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 251DD2A13E8
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Mike Snitzer <snitzer@redhat.com>
Organization: Collabora
References: <20200511163910.3778467-1-krisman@collabora.com>
	<20200511170235.GA7719@redhat.com> <85ftc6l7lb.fsf@collabora.com>
	<20200511173155.GA7892@redhat.com> <20200511184143.GA8274@redhat.com>
Date: Mon, 11 May 2020 14:46:21 -0400
In-Reply-To: <20200511184143.GA8274@redhat.com> (Mike Snitzer's message of
	"Mon, 11 May 2020 14:41:43 -0400")
Message-ID: <85blmul37m.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: breeves@redhat.com, linux-kernel@vger.kernel.org, khazhy@google.com,
	song@kernel.org, dm-devel@redhat.com, mpatocka@redhat.com,
	kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v4 0/2] Historical Service Time Path Selector
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

Mike Snitzer <snitzer@redhat.com> writes:

> OK, that concall's issue had nothing to do with needing higher
> resolution time (was about IOPs realized with requested-based vs
> bio-based).
>
> Reality is, DM won't need anything higher resolution than jiffies until
> block core's interfaces require something other than jiffies
> (e.g. generic_end_io_acct).
>
> So feel free to proceed with the conditional time fetch solution you
> were going to run with (prior to my previous mail asking you to hold
> off).
>
> Sorry for the noise.  Thanks,
> Mike

No problem, thanks for the information.  I get started on it.


-- 
Gabriel Krisman Bertazi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

