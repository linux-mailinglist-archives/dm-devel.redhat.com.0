Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C695241E2
	for <lists+dm-devel@lfdr.de>; Mon, 20 May 2019 22:14:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AC36149A2;
	Mon, 20 May 2019 20:14:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B59318254;
	Mon, 20 May 2019 20:14:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7A023D87;
	Mon, 20 May 2019 20:14:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KKDjIk025208 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 16:13:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 63E775C297; Mon, 20 May 2019 20:13:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3CA5C28F;
	Mon, 20 May 2019 20:13:43 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 091B88535D;
	Mon, 20 May 2019 20:13:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id AA57BAF2B;
	Mon, 20 May 2019 20:13:17 +0000 (UTC)
Message-ID: <bb911c9ca3b0329431753104c2bf99f5a55a50ac.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
To: Bart Van Assche <bvanassche@acm.org>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, mwilck+gmail@suse.de
Date: Mon, 20 May 2019 22:13:16 +0200
In-Reply-To: <70067e86-7f4a-ff06-d747-4f8402199a2f@acm.org>
References: <20190520163008.20642-1-mwilck@suse.com>
	<70067e86-7f4a-ff06-d747-4f8402199a2f@acm.org>
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Mon, 20 May 2019 20:13:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 20 May 2019 20:13:34 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'mwilck@suse.de'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <mwilck@suse.de>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipath-tools (coverity): assert
 availability of CLOCK_MONOTONIC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 20 May 2019 20:14:44 +0000 (UTC)

On Mon, 2019-05-20 at 22:09 +0200, Bart Van Assche wrote:
> On 5/20/19 6:30 PM, Martin Wilck wrote:
> > +void get_monotonic_time(struct timespec *res)
> > +{
> > +	struct timespec ts;
> > +
> > +	assert(clock_gettime(CLOCK_MONOTONIC, &ts) == 0);
> > +	*res = ts;
> > +}
> 
> This is an example of bad coding style because the clock_gettime()
> call
> will be skipped if anyone would compile this code with -DNDEBUG.

I'd rather call it an example of me being ignorant ...
Thanks a lot for pointing it out.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
