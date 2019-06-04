Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AA22E35865
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jun 2019 10:18:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D26ECA3B64;
	Wed,  5 Jun 2019 08:18:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4E045C224;
	Wed,  5 Jun 2019 08:18:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 357A1206D4;
	Wed,  5 Jun 2019 08:18:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x54JbRN1016275 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 15:37:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 682261001E6C; Tue,  4 Jun 2019 19:37:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 623A31001E65
	for <dm-devel@redhat.com>; Tue,  4 Jun 2019 19:37:25 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07F79307E04E
	for <dm-devel@redhat.com>; Tue,  4 Jun 2019 19:37:14 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x7so7751007plr.12
	for <dm-devel@redhat.com>; Tue, 04 Jun 2019 12:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=message-id:mime-version:content-transfer-encoding:in-reply-to
	:references:cc:to:from:subject:user-agent:date;
	bh=wR7K6rwo4Jf2/AFMZkaXDQN87jKfQ96qQ877W6vcmgc=;
	b=ZWkTsPMzXzKaNC9jV4BMIaQAFzkFVB8W3nMso6N1+u6RRZU361q9SzN3hhaamFaj2S
	3FDqL7nnOPRiiOCMeWeg3uelWuIlruaQIHjSSZJBs1thMX54ug2zKZ57AfZyY4FGVBnC
	3GibHDBOiL4ZD2EFcTuR2+80tm+CoOayxGfD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:mime-version
	:content-transfer-encoding:in-reply-to:references:cc:to:from:subject
	:user-agent:date;
	bh=wR7K6rwo4Jf2/AFMZkaXDQN87jKfQ96qQ877W6vcmgc=;
	b=pi+wHJrfXMtCqWWW0EtDpZdoWF3HtRtjjijYVwzv5y0UvafIZu+G+G0t21Ntz7+mWL
	8u3EjJCtDhEgdC68aDr44jtbIH6vzjcbWnnzdtmgq5ybNBEByAIZdNA4RVAcUwN8SAw5
	oYOP/9Jzy8dvgIiGlQj4PA7ebkwQ10xB+5lSBdxDnPSsyVqLjlLEqX3vKTkaqMs7JUZf
	BAij/av3BssGow1vFs7iqvM5J7O4slaJBEL2YRr9TrpDdbiLmGvFAx+I27pLZMFPhQ0Z
	2SWX4rPM9I50c/xqE3TXez29mji+q4Ic4iIr7ASPOdxdP2sTuV+V78M0xyQBE0GBcj2G
	pP1w==
X-Gm-Message-State: APjAAAV/14rpFeWqoSTJIUwhA87pwsyY9vFpV5Zg8mDyu8QpdOdazlYD
	4QOUGx7jf+wXzviuAKlTeKk6vQ==
X-Google-Smtp-Source: APXvYqx/XG7jtVZN3IlWga1sbgAvrTvaf61q+rbJEyovi1zKQb0wfhhWaC0ana2hJwlp7SyRImh+FQ==
X-Received: by 2002:a17:902:d715:: with SMTP id
	w21mr38874215ply.234.1559677033534; 
	Tue, 04 Jun 2019 12:37:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
	by smtp.gmail.com with ESMTPSA id
	128sm20136240pff.16.2019.06.04.12.37.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Jun 2019 12:37:13 -0700 (PDT)
Message-ID: <5cf6c869.1c69fb81.5ed2e.84d1@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20190604182719.15944-1-helen.koike@collabora.com>
References: <20190604182719.15944-1-helen.koike@collabora.com>
To: Helen Koike <helen.koike@collabora.com>, dm-devel@redhat.com
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Tue, 04 Jun 2019 12:37:12 -0700
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 04 Jun 2019 19:37:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 04 Jun 2019 19:37:14 +0000 (UTC) for IP:'209.85.214.194'
	DOMAIN:'mail-pl1-f194.google.com'
	HELO:'mail-pl1-f194.google.com' FROM:'swboyd@chromium.org' RCPT:''
X-RedHat-Spam-Score: -0.12  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	T_DKIMWL_WL_HIGH) 209.85.214.194 mail-pl1-f194.google.com
	209.85.214.194 mail-pl1-f194.google.com <swboyd@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x54JbRN1016275
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 05 Jun 2019 04:13:38 -0400
Cc: wad@chromium.org, keescook@chromium.org, snitzer@redhat.com,
	linux-doc@vger.kernel.org, richard.weinberger@gmail.com,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	Helen Koike <helen.koike@collabora.com>, linux-lvm@redhat.com,
	enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] Documentation/dm-init: fix multi device
	example
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 05 Jun 2019 08:18:06 +0000 (UTC)

Quoting Helen Koike (2019-06-04 11:27:19)
> The example in the docs regarding multiple device-mappers is invalid (it
> has a wrong number of arguments), it's a left over from previous
> versions of the patch.
> Replace the example with an valid and tested one.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
