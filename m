Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B9A5188
	for <lists+dm-devel@lfdr.de>; Mon,  2 Sep 2019 10:26:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A19D710A813C;
	Mon,  2 Sep 2019 08:26:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA37519D7A;
	Mon,  2 Sep 2019 08:26:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8260124F30;
	Mon,  2 Sep 2019 08:26:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7UBQFn9016300 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 07:26:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25FBC1001938; Fri, 30 Aug 2019 11:26:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 205D71001925
	for <dm-devel@redhat.com>; Fri, 30 Aug 2019 11:26:12 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09E82307D90E
	for <dm-devel@redhat.com>; Fri, 30 Aug 2019 11:26:12 +0000 (UTC)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <guilherme.piccoli@canonical.com>) id 1i3f2g-0004Ib-Jb
	for dm-devel@redhat.com; Fri, 30 Aug 2019 11:26:10 +0000
Received: by mail-wr1-f70.google.com with SMTP id j10so4099684wrb.16
	for <dm-devel@redhat.com>; Fri, 30 Aug 2019 04:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ONtyOFC+dZSA4vQOkPiU9xYclPOsHmknJnFItn//m5A=;
	b=uEczga5pwcl7InFBLuC8aVjkbNMxe3poS6PJn4ltN9DP4DNHU8z+VUXfLq5FYL6XvB
	K7fAPSkx/AH49rCpQk7OfhAMZ4TH3yG4AbiQA9WPz36QqCnwzpbNqIazuV5YDNr4NHCz
	8CqGqdlx1Q1Z/HtyimeISRAT/oV01vwls/Cl4xgusbmiAWnvovouFxrdX7iQt+42nUqE
	93LxgQus7GaQ0DC8lbFKdHxDrp+sqIZc+exVzd3MkYCBBsrv9N6yw7wLqCfx9DmDl9sA
	R9IOpeZCTw/OehPmSMH5lWgN5VlYb6yLdm09FpVRuEDVgDI6ovKp3da3pt05BEvCNyuC
	Cc+A==
X-Gm-Message-State: APjAAAWV/Ziw92NIQqgijWF3nEkejlj2+DrmrnFUWtR1WgHxtlshcDjR
	w6Fzf+g7ShEIGMHXOGyf6vlcj/ioKQ9Se5D2KhaOh8LSohk1a79avia+SGPXM7Kq13eT+C24QSQ
	+nF80vMX7yDxMLkEf/P1z/ZVeL3Ajlz0HrguPpDbqJndxdQ==
X-Received: by 2002:adf:ed44:: with SMTP id u4mr8257341wro.185.1567164370414; 
	Fri, 30 Aug 2019 04:26:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzD8gpVqNLfcWj5d2bwlzCAH3DlE5KPUT3AYaexNUWZirMrkm8yqm7IWovyEtVJINJJASgUfjsaN0RaC4cQnpg=
X-Received: by 2002:adf:ed44:: with SMTP id u4mr8257319wro.185.1567164370271; 
	Fri, 30 Aug 2019 04:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190822161318.26236-1-gpiccoli@canonical.com>
	<73C4747E-7A9E-4833-8393-B6A06C935DBE@fb.com>
	<8163258e-839c-e0b8-fc4b-74c94c9dae1d@canonical.com>
	<F0E716F8-76EC-4315-933D-A547B52F1D27@fb.com>
	<5D68FEBC.9060709@youngman.org.uk>
In-Reply-To: <5D68FEBC.9060709@youngman.org.uk>
From: Guilherme Piccoli <gpiccoli@canonical.com>
Date: Fri, 30 Aug 2019 08:25:34 -0300
Message-ID: <CAHD1Q_ypdBKhYRVLrg_kf4L8LdXk8rgiiSQjtmoC=jyRv5M5jQ@mail.gmail.com>
To: Wols Lists <antlists@youngman.org.uk>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Fri, 30 Aug 2019 11:26:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 30 Aug 2019 11:26:12 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com' HELO:'youngberry.canonical.com'
	FROM:'guilherme.piccoli@canonical.com' RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com
	<guilherme.piccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Sep 2019 04:26:12 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <songliubraving@fb.com>,
	Song Liu <liu.song.a23@gmail.com>, NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v3 1/2] md raid0/linear: Mark array as
 'broken' and fail BIOs if a member is gone
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Mon, 02 Sep 2019 08:26:42 +0000 (UTC)

Thanks a lot for all the suggestions Song, Neil and Wol - I'll
implement them and resubmit
(hopefully) Monday.

Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
