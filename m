Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D0E621FEC66
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 09:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592465111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k2Nfr8+uKb+qJsgCRuC1shhfHBZ93A9GoTxgJohmtd8=;
	b=TEuU/68mAChD7mDU2zcVUj7h8Jhfwf1fcg+kNh7UCPyLlbs5jJx6Sb1SJu9mNzUykiMF7g
	6MsvBK4+6jUfWQo9tcxOdSwCzWbTGQa6Wd2267Ech+MMjyGeZ5VQGbqwWuSZfNeZi+F7fm
	wADbXiPwQD8A+ZKa+sDl4ySzumimpCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-xh7TdIqaNYaZWHuT8nB90g-1; Thu, 18 Jun 2020 03:25:08 -0400
X-MC-Unique: xh7TdIqaNYaZWHuT8nB90g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93875835B42;
	Thu, 18 Jun 2020 07:25:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 246B55EE0E;
	Thu, 18 Jun 2020 07:24:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0BF21809547;
	Thu, 18 Jun 2020 07:24:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I7BKbQ010740 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 03:11:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC2FFF101A; Thu, 18 Jun 2020 07:11:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7DF7F11ED
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 07:11:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5188F101A525
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 07:11:18 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-171-9VZDxmKXM4mBv9ZX2c50YA-1; Thu, 18 Jun 2020 03:11:14 -0400
X-MC-Unique: 9VZDxmKXM4mBv9ZX2c50YA-1
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id
	20200618070253epoutp02d782dcdca568242e3c6e8a3fe065d666~ZkV1fvXsr0247102471epoutp02P
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 07:02:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
	20200618070253epoutp02d782dcdca568242e3c6e8a3fe065d666~ZkV1fvXsr0247102471epoutp02P
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20200618070253epcas1p1c42d753f2d53ffd87991676dabf9bcef~ZkV1QN-BP3101931019epcas1p1h;
	Thu, 18 Jun 2020 07:02:53 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.165]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 49nXvJ1Yj8zMqYm9;
	Thu, 18 Jun 2020 07:02:52 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F4.78.18978.A911BEE5; Thu, 18 Jun 2020 16:02:50 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25~ZkVytozK72920429204epcas1p4F;
	Thu, 18 Jun 2020 07:02:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20200618070250epsmtrp2a59c7d796bd7fdfa4f83cb987a94ebdc~ZkVys_xeg2848228482epsmtrp2L;
	Thu, 18 Jun 2020 07:02:50 +0000 (GMT)
X-AuditID: b6c32a35-b8298a8000004a22-bb-5eeb119a7a4a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	39.75.08382.A911BEE5; Thu, 18 Jun 2020 16:02:50 +0900 (KST)
Received: from [10.253.105.155] (unknown [10.253.105.155]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20200618070250epsmtip18810653d5dd9abb3c6c6cd16e3ee97a9~ZkVydJTJ20875208752epsmtip1e;
	Thu, 18 Jun 2020 07:02:50 +0000 (GMT)
To: snitzer@redhat.com
From: JeongHyeon Lee <jhs2.lee@samsung.com>
Message-ID: <98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
Date: Thu, 18 Jun 2020 15:56:50 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmru4swddxBru+2FisP3WM2eLJgXZG
	i73vZrNaLGxbwmJxedccNou2jV8ZHdg8FvdNZvV4v+8qm8fnTXIBzFE5NhmpiSmpRQqpecn5
	KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAe5UUyhJzSoFCAYnFxUr6djZF
	+aUlqQoZ+cUltkqpBSk5BYYGBXrFibnFpXnpesn5uVaGBgZGpkCVCTkZzxd/YC/4qVuxeftS
	5gbG5dpdjJwcEgImEkc7nrJ0MXJxCAnsYJTYMeMLI0hCSOATo8SXpQYQiW+MEi+2djHDdJxb
	ehGqYy+jxNbOg2wQzntGicffXrKCVIkIiEkc6XsAZjMLFElM+f6aCcRmE9CWuN2yiR3EFhYw
	kvh8/SdYnFfATmLS5sVgq1kEVCWubH4MFhcViJC4f2wDK0SNoMTJmU9YIGYGSBx93Qpli0vc
	ejKfCeQICYFODonjlzpZIE51kdj0+xkThC0s8er4FnYIW0ri87u9bBB2ucSVpsuMEHaNxIQL
	3awQtrHE/JaFUC8rSuz8PZcRYhmfxLuvPUA1HEBxXomONiGIEiWJFf+uQa2VkNhwuBtqvIfE
	0tbprJAgjZW48X8qywRG+VlI3pmF5J1ZSN6BsOUltr+dwzwLaBuzgKbE+l36EGaKxI5GH4gK
	RYkp3Q/ZIewGRon+myYLGDlWMYqlFhTnpqcWGxYYIieITYzgdKtluoNx4tsPeocYmTgYDzGq
	APU+2rD6AqMUS15+XqqSCK/z7xdxQrwpiZVVqUX58UWlOanFhxhNgXEzkVlKNDkfmAnySuIN
	TY2MjY0tTMzMzUyNlcR5xWUuxAkJpCeWpGanphakFsH0MXFwSjUwrbuXvfFi/TX3joS8irUf
	vgWXTTJ2OdMVnFv/62XTi5OCovWXt096MuuF8r2ddx++ZrDYZB2178Qd68VnZB8Jn5aKTUvn
	401e3f49YJ/EurToCb3vGw07Qp7GJ8apydU9UWKO7jW8V+Ap8UhunuDBkohS92VJSj8/LrrY
	JCX/9LQk22kRmQnPVs/7whvhMY/JZ5Lo3MWmtn9nHjqb9YX1fuuDablTXFJmKm0tZFHYcc6B
	9eraOf/F5b/dVzxaoFIVseUZ/8/NZadev36Uc/X1/FsRVdPPv/zTutLHbE5hXf2BzcHuFx8v
	lw2527WR2XX+hR2L7oi7P0g6U6vtyJ6Z95HlwQqhP0fMKy+2iIaYhSixFGckGmoxFxUnAgD8
	/1siTAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSnO4swddxBm9ei1msP3WM2eLJgXZG
	i73vZrNaLGxbwmJxedccNou2jV8ZHdg8FvdNZvV4v+8qm8fnTXIBzFFcNimpOZllqUX6dglc
	GT86kgv2q1R82XuLuYFxqlwXIyeHhICJxLmlF1m6GLk4hAR2M0psXbuWFSIhIbFh01r2LkYO
	IFtY4vDhYoiat4wSzSv/sYDUiAiISRzpewBWzyxQJLF62V0wm01AW+J2yyZ2EFtYwEji8/Wf
	TCA2r4CdxKTNixlBbBYBVYkrmx+DxUUFIiTOvF/BAlEjKHFy5hMWiJkBEm9n/IaaLy5x68l8
	pgmM/LOQlM1CUjYLSRmEbSYxb/NDZghbXmL72zlQdorEtscv0cS5gOwGRonbq24yLWDkWMUo
	mVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERwvWpo7GLev+qB3iJGJg/EQowpQ/6MNqy8w
	SrHk5eelKonwOv9+ESfEm5JYWZValB9fVJqTWnyIUZqDRUmc90bhwjghgfTEktTs1NSC1CKY
	LBMHp1QD02LvM88TiwqKfv5IOOej+l9AsnCj/3XRrPJVbzcmnHl8LDXJuznE/MKmNJt18zwb
	JONP95zbtqTTy/3sLvHDKeXV155aBv70mZd+S+vAzK5JP0/6+yQz3d+bpPnh5YQpT6qvVmap
	nnIx1uXQ4WRMM37D/o3zyrx1t8P2ibHfE5hqYzzZV+yyrA3zggaDKO9PWiv3FRQc2dv7zT5P
	8Ya71VZWyccBJTftRBgnikx932Sl8ylUu7pObP+Kl1fv5WyeO+v3YoPkGwx2d86EPk1Yaz1r
	2VQrqbPNJkvPWbc9/H94YWGjy42/j1uvWomFFfyymPJSQu/zPg4di4oFzuzKvBH/3n9pu7Xx
	r0mKfczFp0osxRmJhlrMRcWJAFgT+FASAwAA
X-CMS-MailID: 20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25
References: <CGME20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25@epcas1p4.samsung.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 18 Jun 2020 03:24:25 -0400
Cc: dm-devel@redhat.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, agk@redhat.com, corbet@lwn.net
Subject: [dm-devel] [patch] New mode DM-Verity error handling
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
Content-Type: multipart/mixed; boundary="------------9C73C137154A1ECE1862557A"

This is a multi-part message in MIME format.
--------------9C73C137154A1ECE1862557A
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

Hello, Dear devcice-mapper maintainers.

I'm JeongHyeon Lee, work in Samsung. I'm chage of DM-Verity feature with 
Mr. sunwook eom.
I have a patch or suggestion about DM-Verity error handling.

Our device (smart phone) need DM-Verity feature. So I hope there is new 
mode DM-Verity error handling.
This new mode concept is When detect corrupted block, will be go to panic.

Because our team policy is found device DM-Verity error, device will go 
panic.
And then analyze what kind of device fault (crash UFS, IO error, DRAM 
bit flip etc)

In addition to the smart phone, I would like to have an option that 
users or administrators can use accordingly.
There are patch contents in the attachment. I would really appreciate it 
if you could check it.

I will look forward to hearing from yours.
Thank you :)


--------------9C73C137154A1ECE1862557A
Content-Type: text/x-patch;
	name="0001-dm-verity-new-error-handling-mode-for-corrupted-bloc.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-dm-verity-new-error-handling-mode-for-corrupted-bloc.pa";
	filename*1="tch"

RnJvbSA2ZDNlNTA4ZWQ2ODcyYmZkYzg4ZDZhZDk3OWFjNWMwMzQ3MTQ0ZmJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogImpoczIubGVlIiA8amhzMi5sZWVAc2Ftc3VuZy5jb20+DQpE
YXRlOiBUaHUsIDE4IEp1biAyMDIwIDE1OjMyOjIwICswOTAwDQpTdWJqZWN0OiBbUEFUQ0hdIGRt
IHZlcml0eTogbmV3IGVycm9yIGhhbmRsaW5nIG1vZGUgZm9yIGNvcnJ1cHRlZCBibG9ja3MNCg0K
VGhlcmUgaXMgbm8gcGFuaWMgZXJyb3IgaGFuZGxpbmcgbW9kZSB3aGVuIGEgcHJvYmxlbSBvY2N1
cnMuDQpTbyBXZSBhZGQgbmV3IGVycm9yIGhhbmRsaW5nIG1vZGUuIHVzZXJzIGFuZCBhZG1pbmlz
dHJhdG9ycw0Kc2V0dXAgdG8gZml0IHlvdXIgbmVlZC4NCg0KU2lnbmVkLW9mZi1ieTogamhzMi5s
ZWUgPGpoczIubGVlQHNhbXN1bmcuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlk
ZS9kZXZpY2UtbWFwcGVyL3Zlcml0eS5yc3QgfCAgNCArKysrDQogZHJpdmVycy9tZC9kbS12ZXJp
dHktdGFyZ2V0LmMgICAgICAgICAgICAgICAgICAgICAgfCAxMSArKysrKysrKysrKw0KIGRyaXZl
cnMvbWQvZG0tdmVyaXR5LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKystDQog
MyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvdmVyaXR5LnJz
dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvZGV2aWNlLW1hcHBlci92ZXJpdHkucnN0DQpp
bmRleCBiYjAyY2FhNDUyODkuLjY2ZjcxZjBkYWIxYiAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUvZGV2aWNlLW1hcHBlci92ZXJpdHkucnN0DQorKysgYi9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvdmVyaXR5LnJzdA0KQEAgLTgzLDYgKzgzLDEw
IEBAIHJlc3RhcnRfb25fY29ycnVwdGlvbg0KICAgICBub3QgY29tcGF0aWJsZSB3aXRoIGlnbm9y
ZV9jb3JydXB0aW9uIGFuZCByZXF1aXJlcyB1c2VyIHNwYWNlIHN1cHBvcnQgdG8NCiAgICAgYXZv
aWQgcmVzdGFydCBsb29wcy4NCiANCitwYW5pY19vbl9jb3JydXB0aW9uDQorICAgIFBhbmljIHRo
ZSBkZXZpY2Ugd2hlbiBhIGNvcnJ1cHRlZCBibG9jayBpcyBkaXNjb3ZlcmVkLiBUaGlzIG9wdGlv
biBpcw0KKyAgICBub3QgY29tcGF0aWJsZSB3aXRoIGlnbm9yZV9jb3JydXB0aW9uIGFuZCByZXN0
YXJ0X29uX2NvcnJ1cHRpb24uDQorDQogaWdub3JlX3plcm9fYmxvY2tzDQogICAgIERvIG5vdCB2
ZXJpZnkgYmxvY2tzIHRoYXQgYXJlIGV4cGVjdGVkIHRvIGNvbnRhaW4gemVyb2VzIGFuZCBhbHdh
eXMgcmV0dXJuDQogICAgIHplcm9lcyBpbnN0ZWFkLiBUaGlzIG1heSBiZSB1c2VmdWwgaWYgdGhl
IHBhcnRpdGlvbiBjb250YWlucyB1bnVzZWQgYmxvY2tzDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZC9kbS12ZXJpdHktdGFyZ2V0LmMgYi9kcml2ZXJzL21kL2RtLXZlcml0eS10YXJnZXQuYw0KaW5k
ZXggZWVjOWYyNTJlOTM1Li5jODkxMTRlNzg4NmMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21kL2Rt
LXZlcml0eS10YXJnZXQuYw0KKysrIGIvZHJpdmVycy9tZC9kbS12ZXJpdHktdGFyZ2V0LmMNCkBA
IC0zMCw2ICszMCw3IEBADQogDQogI2RlZmluZSBETV9WRVJJVFlfT1BUX0xPR0dJTkcJCSJpZ25v
cmVfY29ycnVwdGlvbiINCiAjZGVmaW5lIERNX1ZFUklUWV9PUFRfUkVTVEFSVAkJInJlc3RhcnRf
b25fY29ycnVwdGlvbiINCisjZGVmaW5lIERNX1ZFUklUWV9PUFRfUEFOSUMJCSJwYW5pY19vbl9j
b3JydXB0aW9uIg0KICNkZWZpbmUgRE1fVkVSSVRZX09QVF9JR05fWkVST0VTCSJpZ25vcmVfemVy
b19ibG9ja3MiDQogI2RlZmluZSBETV9WRVJJVFlfT1BUX0FUX01PU1RfT05DRQkiY2hlY2tfYXRf
bW9zdF9vbmNlIg0KIA0KQEAgLTI1NCw2ICsyNTUsOSBAQCBzdGF0aWMgaW50IHZlcml0eV9oYW5k
bGVfZXJyKHN0cnVjdCBkbV92ZXJpdHkgKnYsIGVudW0gdmVyaXR5X2Jsb2NrX3R5cGUgdHlwZSwN
CiAJaWYgKHYtPm1vZGUgPT0gRE1fVkVSSVRZX01PREVfUkVTVEFSVCkNCiAJCWtlcm5lbF9yZXN0
YXJ0KCJkbS12ZXJpdHkgZGV2aWNlIGNvcnJ1cHRlZCIpOw0KIA0KKwlpZiAodi0+bW9kZSA9PSBE
TV9WRVJJVFlfTU9ERV9QQU5JQykNCisJCXBhbmljKCJkbS12ZXJpdHkgZGV2aWNlIGNvcnJ1cHRl
ZCIpOw0KKw0KIAlyZXR1cm4gMTsNCiB9DQogDQpAQCAtNzQyLDYgKzc0Niw5IEBAIHN0YXRpYyB2
b2lkIHZlcml0eV9zdGF0dXMoc3RydWN0IGRtX3RhcmdldCAqdGksIHN0YXR1c190eXBlX3QgdHlw
ZSwNCiAJCQljYXNlIERNX1ZFUklUWV9NT0RFX1JFU1RBUlQ6DQogCQkJCURNRU1JVChETV9WRVJJ
VFlfT1BUX1JFU1RBUlQpOw0KIAkJCQlicmVhazsNCisJCQljYXNlIERNX1ZFUklUWV9NT0RFX1BB
TklDOg0KKwkJCQlETUVNSVQoRE1fVkVSSVRZX09QVF9QQU5JQyk7DQorCQkJCWJyZWFrOw0KIAkJ
CWRlZmF1bHQ6DQogCQkJCUJVRygpOw0KIAkJCX0NCkBAIC05MDcsNiArOTE0LDEwIEBAIHN0YXRp
YyBpbnQgdmVyaXR5X3BhcnNlX29wdF9hcmdzKHN0cnVjdCBkbV9hcmdfc2V0ICphcywgc3RydWN0
IGRtX3Zlcml0eSAqdiwNCiAJCQl2LT5tb2RlID0gRE1fVkVSSVRZX01PREVfUkVTVEFSVDsNCiAJ
CQljb250aW51ZTsNCiANCisJCX0gZWxzZSBpZiAoIXN0cmNhc2VjbXAoYXJnX25hbWUsIERNX1ZF
UklUWV9PUFRfUEFOSUMpKSB7DQorCQkJdi0+bW9kZSA9IERNX1ZFUklUWV9NT0RFX1BBTklDOw0K
KwkJCWNvbnRpbnVlOw0KKw0KIAkJfSBlbHNlIGlmICghc3RyY2FzZWNtcChhcmdfbmFtZSwgRE1f
VkVSSVRZX09QVF9JR05fWkVST0VTKSkgew0KIAkJCXIgPSB2ZXJpdHlfYWxsb2NfemVyb19kaWdl
c3Qodik7DQogCQkJaWYgKHIpIHsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLXZlcml0eS5o
IGIvZHJpdmVycy9tZC9kbS12ZXJpdHkuaA0KaW5kZXggNjQxYjllM2EzOTliLi40ZTc2OWQxMzQ3
M2EgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21kL2RtLXZlcml0eS5oDQorKysgYi9kcml2ZXJzL21k
L2RtLXZlcml0eS5oDQpAQCAtMjAsNyArMjAsOCBAQA0KIGVudW0gdmVyaXR5X21vZGUgew0KIAlE
TV9WRVJJVFlfTU9ERV9FSU8sDQogCURNX1ZFUklUWV9NT0RFX0xPR0dJTkcsDQotCURNX1ZFUklU
WV9NT0RFX1JFU1RBUlQNCisJRE1fVkVSSVRZX01PREVfUkVTVEFSVCwNCisJRE1fVkVSSVRZX01P
REVfUEFOSUMNCiB9Ow0KIA0KIGVudW0gdmVyaXR5X2Jsb2NrX3R5cGUgew0KLS0gDQoyLjE3LjEN
Cg0K
--------------9C73C137154A1ECE1862557A
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--------------9C73C137154A1ECE1862557A--

