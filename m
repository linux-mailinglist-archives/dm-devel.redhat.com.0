Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D83E7870E
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jul 2019 10:13:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB276307D914;
	Mon, 29 Jul 2019 08:13:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 867F55C22B;
	Mon, 29 Jul 2019 08:13:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98632180B7B0;
	Mon, 29 Jul 2019 08:12:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6T14SJ4010154 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Jul 2019 21:04:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE2935B685; Mon, 29 Jul 2019 01:04:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 847B95B683;
	Mon, 29 Jul 2019 01:04:24 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 441193084249;
	Mon, 29 Jul 2019 01:04:05 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6T13Z7j002189; Mon, 29 Jul 2019 01:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=PdcdzZqByBsaJyFO6zEiMqm8RLM0rmvXzok8u84h7X0=;
	b=B82Lq/jHSPm245ufPF5M6jy2Eo6E1wZPk3U4D7Yb5mvr3xuSNflB6H5sN+awMaP5/Nx5
	/TbzU3VSBQ4la/fRMI5hdNQA8u9NbGBkC4UdGEw0tksCWU8hqsMbBUukJyQ6YrF420TU
	RWQPElUdaIj/mdBhdRahbwuZc8c8WNnR1h1XH6h7RpjEPDVy/KmdoHcpKyVLU5MMLO+6
	BwkhFag5ysFg1ATmZqnmPp/pMnh8rwoaRTzyxu/hT3vzGzUaDQDvfWmomyhjB0pq4voa
	Kcc7DZehQqFfwpxyDZ69ha2zE6pGOmd2xAMyf7ivC72uW7QsQBZCGZKmjXT4viLBEv9w
	7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 2u0e1tcfc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jul 2019 01:03:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6T12tCC124045; Mon, 29 Jul 2019 01:03:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 2u0ee3n58p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jul 2019 01:03:33 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6T13UEn008054;
	Mon, 29 Jul 2019 01:03:30 GMT
Received: from [192.168.1.14] (/180.165.87.209)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sun, 28 Jul 2019 18:03:30 -0700
To: syzbot <syzbot+03e5c8ebd22cc6c3a8cb@syzkaller.appspotmail.com>,
	agk@redhat.com, axboe@kernel.dk, coreteam@netfilter.org,
	davem@davemloft.net, dm-devel@redhat.com, hdanton@sina.com,
	kaber@trash.net, kadlec@blackhole.kfki.hu, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
	pablo@netfilter.org, shli@kernel.org, snitzer@redhat.com,
	syzkaller-bugs@googlegroups.com
References: <000000000000aec4ec058ec71a3d@google.com>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <81dcfa59-152c-4f22-2054-615662364394@oracle.com>
Date: Mon, 29 Jul 2019 09:03:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <000000000000aec4ec058ec71a3d@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9332
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1907290010
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9332
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1907290010
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Mon, 29 Jul 2019 01:04:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 29 Jul 2019 01:04:20 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'bob.liu@oracle.com' RCPT:''
X-RedHat-Spam-Score: -99.927  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SORTED_RECIPS, SPF_HELO_PASS,
	SPF_NONE,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <bob.liu@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jul 2019 04:12:24 -0400
Subject: Re: [dm-devel] memory leak in bio_copy_user_iov
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 29 Jul 2019 08:13:09 +0000 (UTC)

T24gNy8yOS8xOSA4OjM4IEFNLCBzeXpib3Qgd3JvdGU6Cj4gc3l6Ym90IGhhcyBiaXNlY3RlZCB0
aGlzIGJ1ZyB0bzoKPiAKPiBjb21taXQgNjY0ODIwMjY1ZDcwYTc1OWRjZWNhODdiNmViMjAwY2Qy
YjkzY2RhOAo+IEF1dGhvcjogTWlrZSBTbml0emVyIDxzbml0emVyQHJlZGhhdC5jb20+Cj4gRGF0
ZTrCoMKgIFRodSBGZWIgMTggMjA6NDQ6MzkgMjAxNiArMDAwMAo+IAo+IMKgwqDCoCBkbTogZG8g
bm90IHJldHVybiB0YXJnZXQgZnJvbSBkbV9nZXRfbGl2ZV90YWJsZV9mb3JfaW9jdGwoKQo+IAoK
VGhpcyhhbmQgcHJldmlvdXMgYmlzZWN0aW9uKSBsb29rIG5vdCByZWxhdGVkIHRvIHRoZSByZXBv
cnRlZCBsZWFrLgoKCkEgcG9zc2libGUgcmVhc29uIG1heSBiZSBLQVNBTiBjYW4ndCByZWNvZ25p
emUgdGhlIGZhaWx1cmUgcGF0aCBvZiBiaW9fYWxsb2NfYmlvc2V0KCkKd2hlcmUgbWVtcG9vbF9m
cmVlKCkgaXMgY2FsbGVkIGJ1dCBub3Qga21hbGxvYyhwKS4KCkJ1dCBpdCdzIG5vdCBhIHJlYWwg
YnVnLCBiZWNhdXNlIHdlIGhhdmUgdGhlIGNvbmRpdGlvbiBpZiAobnJfaW92ZWNzID4gaW5saW5l
X3ZlY3MpLgoKQmVsb3cgZml4IG1heSBhdm9pZCB0aGUgc3l6Ym90IGJ1ZyByZXBvcnQuLgoKZGlm
ZiAtLWdpdCBhL2Jsb2NrL2Jpby5jIGIvYmxvY2svYmlvLmMKaW5kZXggNGRiMTAwOC4uMDRhNzg3
OSAxMDA2NDQKLS0tIGEvYmxvY2svYmlvLmMKKysrIGIvYmxvY2svYmlvLmMKQEAgLTUxMyw4ICs1
MTMsMTAgQEAgc3RydWN0IGJpbyAqYmlvX2FsbG9jX2Jpb3NldChnZnBfdCBnZnBfbWFzaywgdW5z
aWduZWQgaW50IG5yX2lvdmVjcywKICAgICAgICAgICAgICAgICAgICAgICAgYnZsID0gYnZlY19h
bGxvYyhnZnBfbWFzaywgbnJfaW92ZWNzLCAmaWR4LCAmYnMtPmJ2ZWNfcG9vbCk7CiAgICAgICAg
ICAgICAgICB9CiAKLSAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSghYnZsKSkKLSAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBlcnJfZnJlZTsKKyAgICAgICAgICAgICAgIGlmICh1bmxpa2Vs
eSghYnZsKSkgeworICAgICAgICAgICAgICAgICAgICAgICBtZW1wb29sX2ZyZWUocCwgJmJzLT5i
aW9fcG9vbCk7CisgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOworICAgICAgICAg
ICAgICAgfQogCiAgICAgICAgICAgICAgICBiaW8tPmJpX2ZsYWdzIHw9IGlkeCA8PCBCVkVDX1BP
T0xfT0ZGU0VUOwogICAgICAgIH0gZWxzZSBpZiAobnJfaW92ZWNzKSB7CkBAIC01MjUsMTAgKzUy
Nyw2IEBAIHN0cnVjdCBiaW8gKmJpb19hbGxvY19iaW9zZXQoZ2ZwX3QgZ2ZwX21hc2ssIHVuc2ln
bmVkIGludCBucl9pb3ZlY3MsCiAgICAgICAgYmlvLT5iaV9tYXhfdmVjcyA9IG5yX2lvdmVjczsK
ICAgICAgICBiaW8tPmJpX2lvX3ZlYyA9IGJ2bDsKICAgICAgICByZXR1cm4gYmlvOwotCi1lcnJf
ZnJlZToKLSAgICAgICBtZW1wb29sX2ZyZWUocCwgJmJzLT5iaW9fcG9vbCk7Ci0gICAgICAgcmV0
dXJuIE5VTEw7CiB9CiBFWFBPUlRfU1lNQk9MKGJpb19hbGxvY19iaW9zZXQpOwoKClJlZ2FyZHMs
IC1Cb2IKCj4gYmlzZWN0aW9uIGxvZzrCoCBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5j
b20vdjIvdXJsP3U9aHR0cHMtM0FfX3N5emthbGxlci5hcHBzcG90LmNvbV94X2Jpc2VjdC50eHQt
M0Z4LTNEMTNmNGViNjQ2MDAwMDAmZD1Ed0lCYVEmYz1Sb1AxWXVtQ1hDZ2FXSHZsWllSOFBaaDhC
djdxSXJNVUI2NWVhcElfSm5FJnI9MWt0VDBVMllTX0k4Wnoyby1NUzFZY0NBeldaNmhGR3R5VGd2
Vk1HTTdnSSZtPU5mR1FSVnhZQ2ZaYWNBS2ltbDlXdWUtRzFyMmg4cWt1QWhBTU94X3VGY2Mmcz1N
TmpZeV9uZnRfczBFcm1LMm44OXA3eTJ5aEttZVdseFdjaDB6N19kc204JmU9c3RhcnQgY29tbWl0
OsKgwqAgMDAxMTU3MmMgTWVyZ2UgYnJhbmNoICdmb3ItNS4yLWZpeGVzJyBvZiBnaXQ6Ly9naXQu
a2VybmVsLi4uCj4gZ2l0IHRyZWU6wqDCoMKgwqDCoMKgIHVwc3RyZWFtCj4gZmluYWwgY3Jhc2g6
wqDCoMKgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0z
QV9fc3l6a2FsbGVyLmFwcHNwb3QuY29tX3hfcmVwb3J0LnR4dC0zRngtM0QxMDBjZWI2NDYwMDAw
MCZkPUR3SUJhUSZjPVJvUDFZdW1DWENnYVdIdmxaWVI4UFpoOEJ2N3FJck1VQjY1ZWFwSV9KbkUm
cj0xa3RUMFUyWVNfSThaejJvLU1TMVljQ0F6V1o2aEZHdHlUZ3ZWTUdNN2dJJm09TmZHUVJWeFlD
ZlphY0FLaW1sOVd1ZS1HMXIyaDhxa3VBaEFNT3hfdUZjYyZzPWl2aVBPUU5QRUlqa3VxQm1hX1ZX
RVE5bDFWZTNlT2lUd2FkczQyRTRaUG8mZT1jb25zb2xlIG91dHB1dDogaHR0cHM6Ly91cmxkZWZl
bnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19zeXprYWxsZXIuYXBwc3BvdC5j
b21feF9sb2cudHh0LTNGeC0zRDE3ZjRlYjY0NjAwMDAwJmQ9RHdJQmFRJmM9Um9QMVl1bUNYQ2dh
V0h2bFpZUjhQWmg4QnY3cUlyTVVCNjVlYXBJX0puRSZyPTFrdFQwVTJZU19JOFp6Mm8tTVMxWWND
QXpXWjZoRkd0eVRndlZNR003Z0kmbT1OZkdRUlZ4WUNmWmFjQUtpbWw5V3VlLUcxcjJoOHFrdUFo
QU1PeF91RmNjJnM9TUJ3bkZ3akVjU1FmWXltZnY4RVl0X0Vhd1ZkSzl2RC1PQXFETXV0Ty1ZWSZl
PWtlcm5lbCBjb25maWc6wqAgaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3Vy
bD91PWh0dHBzLTNBX19zeXprYWxsZXIuYXBwc3BvdC5jb21feF8uY29uZmlnLTNGeC0zRGNiMzhk
MzNjZDA2ZDhkNDgmZD1Ed0lCYVEmYz1Sb1AxWXVtQ1hDZ2FXSHZsWllSOFBaaDhCdjdxSXJNVUI2
NWVhcElfSm5FJnI9MWt0VDBVMllTX0k4Wnoyby1NUzFZY0NBeldaNmhGR3R5VGd2Vk1HTTdnSSZt
PU5mR1FSVnhZQ2ZaYWNBS2ltbDlXdWUtRzFyMmg4cWt1QWhBTU94X3VGY2Mmcz1TcW1EVWVuTkZT
LTk2MVBHZ2lNVzVtSVV2MG5JQnJmMG9CcnpVeFlaOERvJmU9ZGFzaGJvYXJkIGxpbms6Cj4gaHR0
cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19zeXprYWxs
ZXIuYXBwc3BvdC5jb21fYnVnLTNGZXh0aWQtM0QwM2U1YzhlYmQyMmNjNmMzYThjYiZkPUR3SUJh
USZjPVJvUDFZdW1DWENnYVdIdmxaWVI4UFpoOEJ2N3FJck1VQjY1ZWFwSV9KbkUmcj0xa3RUMFUy
WVNfSThaejJvLU1TMVljQ0F6V1o2aEZHdHlUZ3ZWTUdNN2dJJm09TmZHUVJWeFlDZlphY0FLaW1s
OVd1ZS1HMXIyaDhxa3VBaEFNT3hfdUZjYyZzPWpLZDJvY1k1WDk0dXlCOE9yLU9DM3lmZmJPZ0Ns
UFFQbFhxRm5MenZ2U1kmZT1zeXogcmVwcm86wqDCoMKgwqDCoCBodHRwczovL3VybGRlZmVuc2Uu
cHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX3N5emthbGxlci5hcHBzcG90LmNvbV94
X3JlcHJvLnN5ei0zRngtM0QxMzI0NDIyMWEwMDAwMCZkPUR3SUJhUSZjPVJvUDFZdW1DWENnYVdI
dmxaWVI4UFpoOEJ2N3FJck1VQjY1ZWFwSV9KbkUmcj0xa3RUMFUyWVNfSThaejJvLU1TMVljQ0F6
V1o2aEZHdHlUZ3ZWTUdNN2dJJm09TmZHUVJWeFlDZlphY0FLaW1sOVd1ZS1HMXIyaDhxa3VBaEFN
T3hfdUZjYyZzPUstQzM5S2NkMW9FT3RKS3duYnktczFFeUVaWkExMG1yOWJjWFowSjlLaDAmZT1D
IHJlcHJvZHVjZXI6wqDCoCBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJs
P3U9aHR0cHMtM0FfX3N5emthbGxlci5hcHBzcG90LmNvbV94X3JlcHJvLmMtM0Z4LTNEMTE3YjI0
MzJhMDAwMDAmZD1Ed0lCYVEmYz1Sb1AxWXVtQ1hDZ2FXSHZsWllSOFBaaDhCdjdxSXJNVUI2NWVh
cElfSm5FJnI9MWt0VDBVMllTX0k4Wnoyby1NUzFZY0NBeldaNmhGR3R5VGd2Vk1HTTdnSSZtPU5m
R1FSVnhZQ2ZaYWNBS2ltbDlXdWUtRzFyMmg4cWt1QWhBTU94X3VGY2Mmcz03SjY4NUN3UU42X0ZB
MktnTzNWZ3kxbXNGMHppNU8wT3Faal9iZ3ZFcUJFJmU9Cj4gUmVwb3J0ZWQtYnk6IHN5emJvdCsw
M2U1YzhlYmQyMmNjNmMzYThjYkBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gRml4ZXM6IDY2
NDgyMDI2NWQ3MCAoImRtOiBkbyBub3QgcmV0dXJuIHRhcmdldCBmcm9tIGRtX2dldF9saXZlX3Rh
YmxlX2Zvcl9pb2N0bCgpIikKPiAKPiBGb3IgaW5mb3JtYXRpb24gYWJvdXQgYmlzZWN0aW9uIHBy
b2Nlc3Mgc2VlOiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0
cHMtM0FfX2dvby5nbF90cHNtRUotMjNiaXNlY3Rpb24mZD1Ed0lCYVEmYz1Sb1AxWXVtQ1hDZ2FX
SHZsWllSOFBaaDhCdjdxSXJNVUI2NWVhcElfSm5FJnI9MWt0VDBVMllTX0k4Wnoyby1NUzFZY0NB
eldaNmhGR3R5VGd2Vk1HTTdnSSZtPU5mR1FSVnhZQ2ZaYWNBS2ltbDlXdWUtRzFyMmg4cWt1QWhB
TU94X3VGY2Mmcz1yczUyVGtpRVFDclY0VjhZUWEyd1Q1NUhEOEUtMEFYOXBuN01OSURjamU0JmU9
CgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3
dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
