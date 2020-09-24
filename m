Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 781C2277AEF
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 23:10:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-GBkIMaeMM5iSp1xQU20P5g-1; Thu, 24 Sep 2020 17:10:48 -0400
X-MC-Unique: GBkIMaeMM5iSp1xQU20P5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDCA31084C9B;
	Thu, 24 Sep 2020 21:10:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D65D78800;
	Thu, 24 Sep 2020 21:10:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA9511826D2A;
	Thu, 24 Sep 2020 21:10:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OLATM6016409 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 17:10:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 84F5D109EF6B; Thu, 24 Sep 2020 21:10:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80580109EF68
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 21:10:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70257185A78B
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 21:10:25 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-573-gLVAVvhQOSmgFLfEQKuXNw-1; Thu, 24 Sep 2020 17:10:21 -0400
X-MC-Unique: gLVAVvhQOSmgFLfEQKuXNw-1
Received: by mail-pf1-f181.google.com with SMTP id n14so716921pff.6
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 14:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=BmNg0kZXOFiuoaGYw4ckfNG1K1OER8LMBYDzE2qb3Bk=;
	b=XDWjDYaGsL/EuiLhXbDXe25zR5AlGIadly1gg9e8o8Dt8yTt0mQAr4YO+ee47kL1AO
	I9x866KyaKOFKEkfIEhCj1FeK6krzML3Uhem7Bd2XM/2gA8B2vICcWKTHDLzlCKidCEq
	7lzzBvq2a0eep8uRQ11bvzk9lYwF3KHPtof878OwaIdL8W9nwwV2WNj6YSKb+wuypAiV
	8rC0c0Hk1hlbLmFMEU0MYQrZ6NeElEDQpy989h5cngGuCya021s5/UP6BTi9BoxMggGW
	0EH3lKXGNyXyE3AGSf5SC6xctNzXHkn0uqTqzMTGpTG3HP0bGLgo8Fzgh8yXtbyMpzn8
	i0Ng==
X-Gm-Message-State: AOAM531672uM+GpkOX7jZ8O4i+R2yCeKpxP+LEVnvR9Jp7x+jp05AJBX
	xdgBIJL2zFKjJ5Jcce5DMKGBFL4eIivQJvpjqVDFxCCys20TuKQ6sVCvqblec/CohWnBONohaRN
	MaGMtGAlzaYYotu/wsfBzx8X2pZs5OjQpovelolQ/ULPF2dq0V5VQ3O2ouShc6XEgGGiWdw==
X-Google-Smtp-Source: ABdhPJzI1BDAVvDMk5NgAsZZqoI9IpIYwh12fgFRKT7WQ1qlOXK0oOP2m8MAlARBhPFOLkYfiG4O4A==
X-Received: by 2002:a63:490d:: with SMTP id w13mr805238pga.24.1600981819614;
	Thu, 24 Sep 2020 14:10:19 -0700 (PDT)
Received: from localhost.localdomain ([192.30.189.3])
	by smtp.gmail.com with ESMTPSA id i2sm375884pfq.89.2020.09.24.14.10.18
	for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Sep 2020 14:10:18 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.0.3.2.33\))
Message-Id: <04F146B1-3EB2-42C0-87EA-E0EABC3D8020@purestorage.com>
Date: Thu, 24 Sep 2020 14:10:17 -0700
To: device-mapper development <dm-devel@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08OLATM6016409
X-loop: dm-devel@redhat.com
Subject: [dm-devel] Make LUNs higher than 255 more friendly to look at
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rm9yIExVTnMgYmV0d2VlbiAwIGFuZCAyNTUgcGVyaXBoZXJhbCBhZGRyZXNzaW5nIGlzIHVzZWQu
IEZvciBMVU5zIGhpZ2hlciB0aGFuIDI1NSB0aGUgTFVOIGFkZHJlc3NpbmcKc2hvdWxkIHN3aXRj
aCB0byBmbGF0IGFjY29yZGluZyB0byB0aGUgc3BlY2lmaWNhdGlvbi4gSW5zdGVhZCBvZiBwcmlu
dGluZyBvdXQgdGhlIExVTiBudW1iZXIgd2l0aG91dCByZWdhcmQgdG8KdGhlIHNoaWZ0aW5nIG9m
IGFkZHJlc3MgbWV0aG9kLCBkaXNwbGF5IHRoZSBMVU4gYXMgaXQgd2FzIGludGVuZGVkIHRvIGJl
IHRoZSB1c2VyIGNvbm5lY3RpbmcgdGhlIExVTi4gVGhlCmN1cnJlbnQgZGlzcGxheSBsZWF2ZXMg
YSBub24tb2J2aW91cyAxNjM4NCBvZmZzZXQuCgpJbiBzaG9ydCwgYSBMVU4gY29ubmVjdGVkIGFz
IDI1OCB3aWxsIHNob3cgdXAgaW4gbXVsdGlwYXRoIG91dHB1dCBhcyAxNjY0Mi4gSW5zdGVhZCBk
aXNwbGF5IGl0IGFzIHRoZQpleHBlY3RlZCAyNTguIFRoaXMgaXMgZm9yIGRpc3BsYXkgb25seSBh
bmQgZG9lc27igJl0IGNoYW5nZSB0aGUgYWN0dWFsIGNvbnRlbnRzIG9mIHRoZSBMVU4gdmFyaWFi
bGUuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBCdW5rZXIgPGJyaWFuQHB1cmVzdG9yYWdlLmNvbT4K
X19fCi0tLSBhL2xpYm11bHRpcGF0aC9wcmludC5jICAgICAgMjAyMC0wOS0yNCAxMzo1MjoxOC42
NjE4MjgwMTEgLTA2MDAKKysrIGIvbGlibXVsdGlwYXRoL3ByaW50LmMgICAgICAyMDIwLTA5LTI0
IDE0OjI4OjI3LjYwMzU0MjMwMyAtMDYwMApAQCAtMzk0LDcgKzM5NCw3IEBACiAgICAgICAgICAg
ICAgICAgICAgICAgIHBwLT5zZ19pZC5ob3N0X25vLAogICAgICAgICAgICAgICAgICAgICAgICBw
cC0+c2dfaWQuY2hhbm5lbCwKICAgICAgICAgICAgICAgICAgICAgICAgcHAtPnNnX2lkLnNjc2lf
aWQsCi0gICAgICAgICAgICAgICAgICAgICAgIHBwLT5zZ19pZC5sdW4pOworICAgICAgICAgICAg
ICAgICAgICAgICAocHAtPnNnX2lkLmx1biAmIDB4NDAwMCkgPyBwcC0+c2dfaWQubHVuIC0gMHg0
MDAwIDogcHAtPnNnX2lkLmx1bik7CiB9Cgogc3RhdGljIGludAoKQnJpYW4gQnVua2VyClNXIEVu
ZwpicmlhbkBwdXJlc3RvcmFnZS5jb20KCgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1k
ZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
bS1kZXZlbA==

