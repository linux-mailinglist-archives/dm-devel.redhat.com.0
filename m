Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD78310093F
	for <lists+dm-devel@lfdr.de>; Mon, 18 Nov 2019 17:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574094781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3oAM1m8jZt738ZY0iHjmL+Cs30x9AVgqrEmwyDMJF/0=;
	b=Ff3vMSUsDWgH2FdYqiWwi7pTbgTzLYF/P+B9AC9L1mKdFUUNxgAFcZI5FNqb3idv8wVImw
	Vh+ORBQxDHq1qOKxHhA6NVcTAyihLcRqPFzW8N6NotSMq77secXXxotRvkloT104UVNM0U
	UcMpGrr+lM3rfFVUJlswUqScauju5sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-dUrGNStnMA2I7VL-ouXedg-1; Mon, 18 Nov 2019 11:32:59 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0863910889BC;
	Mon, 18 Nov 2019 16:32:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB3C3BA44;
	Mon, 18 Nov 2019 16:32:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48CF94BB65;
	Mon, 18 Nov 2019 16:32:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAIGWW2H024898 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 Nov 2019 11:32:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6D48B6B8FB; Mon, 18 Nov 2019 16:32:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02830643E4;
	Mon, 18 Nov 2019 16:32:20 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>)
	id 1iWjwo-0006wm-FL; Mon, 18 Nov 2019 16:32:18 +0000
Date: Mon, 18 Nov 2019 16:32:18 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20191118163218.GF1800@agk-dp.fab.redhat.com>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com
References: <20191115190525.77efdf6c@canb.auug.org.au>
	<f368f431-b741-d04f-440b-3d8c3c035537@infradead.org>
	<d3a96436-0d9c-a13f-7524-33b203910367@infradead.org>
MIME-Version: 1.0
In-Reply-To: <d3a96436-0d9c-a13f-7524-33b203910367@infradead.org>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Peninsular House, 30-36 Monument
	Street, 4th Floor, London, England, EC3R 8NB.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Snitzer <snitzer@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dm-devel@redhat.com, Linux Next Mailing List <linux-next@vger.kernel.org>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] linux-next: Tree for Nov 15 (drivers/md/dm-integrity)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: dUrGNStnMA2I7VL-ouXedg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Nov 15, 2019 at 08:19:53AM -0800, Randy Dunlap wrote:
> BTW, dm-devel@redhat.com seems to be invalid or dead.

Red Hat made a few changes to its mail configuration over the last
week.

If anyone reading this still has problems that might be related to
this, please send me the relevant details privately (e.g. full headers
of messages) and I'll try to engage the right people to help.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

